#!/bin/bash

# Define constants
OPERAND_SIZES=(256 512 1024 2048 4096 8192 16384 32768 65536 131072)
MODES=(1 2)
ITERATIONS=10
CORE=0
BASE_DIR="$(pwd)"

# Set up directory structure
RESULTS_DIR="${BASE_DIR}/performance_results"
RAW_DATA_DIR="$RESULTS_DIR/raw_data"
STATS_DIR="$RESULTS_DIR/stats"

# Prepare directories and output files
mkdir -p "$RAW_DATA_DIR/baseline" "$RAW_DATA_DIR/gmp" "$RAW_DATA_DIR/pml_add" "$RAW_DATA_DIR/pml_add_approx"
mkdir -p "$STATS_DIR"

# Create CSV files for statistics
echo "model,operand_size,min,max,avg,std_dev" > "$STATS_DIR/execution_time.csv"
echo "model,operand_size,min,max,avg,std_dev" > "$STATS_DIR/throughput.csv"
echo "model,operand_size,min,max,avg,std_dev" > "$STATS_DIR/user_instructions.csv" 
echo "model,operand_size,min,max,avg,std_dev" > "$STATS_DIR/rdtsc_ticks.csv"

# Log function for better debugging
log_info() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] [INFO] $1"
}

log_error() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] [ERROR] $1" >&2
}

log_progress() {
    local current=$1
    local total=$2
    local percent=$((current * 100 / total))
    local bar_size=40
    local bar_complete=$((percent * bar_size / 100))
    local bar=""
    
    for ((i=0; i<bar_complete; i++)); do
        bar+="#"
    done
    
    for ((i=bar_complete; i<bar_size; i++)); do
        bar+=" "
    done
    
    printf "\r[%s] %3d%% (%d/%d)" "$bar" "$percent" "$current" "$total"
}

# Compile all models
compile_models() {
    log_info "Compiling all models..."
    
    # Compile GMP
    log_info "Compiling GMP model..."
    cd "${BASE_DIR}/gmp"
    if gcc add.c ../utils/perf_utils.c -o add -lgmp -lz -I../utils -O2 -mavx512f -mavx512vl; then
        log_info "GMP model compiled successfully"
    else
        log_error "Failed to compile GMP model"
        exit 1
    fi
    
    # Compile Baseline
    log_info "Compiling Baseline model..."
    cd "${BASE_DIR}/baseline"
    if gcc add.c limb_utils.c perf_utils.c -o add -lz -I. -O2 -fno-tree-vectorize; then
        log_info "Baseline model compiled successfully"
    else
        log_error "Failed to compile Baseline model"
        exit 1
    fi
    
    # Compile PML Add
    log_info "Compiling PML Add model..."
    cd "${BASE_DIR}/pml_add"
    if gcc add.c ../utils/perf_utils.c ../utils/limb_utils.c -o add -lz -I../utils -O1 -mavx512f -mavx512vl; then
        log_info "PML Add model compiled successfully"
    else
        log_error "Failed to compile PML Add model"
        exit 1
    fi
    
    # Compile PML Add Approx
    log_info "Compiling PML Add Approx model..."
    cd "${BASE_DIR}/pml_add_approx"
    if gcc add.c ../utils/perf_utils.c ../utils/limb_utils.c -o add -lz -I../utils -O1 -mavx512f -mavx512vl; then
        log_info "PML Add Approx model compiled successfully"
    else
        log_error "Failed to compile PML Add Approx model"
        exit 1
    fi
    
    # Return to base directory
    cd "${BASE_DIR}"
    log_info "All models compiled successfully."
}

# Run a single test for a specific model, operand size, and mode
run_test() {
    local model=$1
    local size=$2
    local mode=$3
    local iteration=$4
    local output_file="$RAW_DATA_DIR/$model/${model}_${size}_mode${mode}_iter${iteration}.txt"
    
    cd "${BASE_DIR}/${model}"
    log_info "Running $model: size=$size, mode=$mode, iteration=$iteration"
    
    if sudo taskset -c $CORE ./add $size 0 0 2 $mode > "$output_file" 2>/dev/null; then
        # Check if the output file contains expected data
        if [[ -f "$output_file" ]]; then
            if [[ $mode -eq 1 && $(grep -c "Execution time:" "$output_file") -eq 0 ]]; then
                log_error "No execution time found in output for $model (size=$size, mode=$mode, iteration=$iteration)"
            elif [[ $mode -eq 2 && $(grep -c "User instructions:" "$output_file") -eq 0 ]]; then
                log_error "No user instructions found in output for $model (size=$size, mode=$mode, iteration=$iteration)"
            fi
        else
            log_error "Output file was not created for $model (size=$size, mode=$mode, iteration=$iteration)"
        fi
    else
        log_error "Failed to run test for $model (size=$size, mode=$mode, iteration=$iteration)"
    fi
    
    cd "${BASE_DIR}"
}

# Run all tests for all models, operand sizes, and modes
run_all_tests() {
    log_info "Running all tests..."
    
    # Calculate total number of tests
    local total_tests=$((${#OPERAND_SIZES[@]} * ${#MODES[@]} * ITERATIONS * 4))
    local current_test=0
    
    for model in "baseline" "gmp" "pml_add" "pml_add_approx"; do
        log_info "Starting tests for model: $model"
        
        for size in "${OPERAND_SIZES[@]}"; do
            for mode in "${MODES[@]}"; do
                for ((i=1; i<=ITERATIONS; i++)); do
                    run_test "$model" "$size" "$mode" "$i"
                    current_test=$((current_test + 1))
                    log_progress $current_test $total_tests
                done
            done
        done
        
        log_info "Completed all tests for model: $model"
        echo ""  # Add a newline after the progress bar
    done
    
    echo ""  # Add a newline after the progress bar
    log_info "All tests completed successfully."
}

# Extract data from test results and compute statistics
compute_statistics() {
    log_info "Computing statistics..."
    
    local total_stats=$((${#OPERAND_SIZES[@]} * 4))
    local current_stat=0
    
    for model in "baseline" "gmp" "pml_add" "pml_add_approx"; do
        log_info "Computing statistics for model: $model"
        
        for size in "${OPERAND_SIZES[@]}"; do
            log_info "Processing operand size: $size for $model"
            
            # Process mode 1: Execution time and Throughput
            if [[ -f "$RAW_DATA_DIR/$model/${model}_${size}_mode1_iter1.txt" ]]; then
                # Extract execution time values
                exec_times=()
                valid_exec_times=0
                for ((i=1; i<=ITERATIONS; i++)); do
                    file="$RAW_DATA_DIR/$model/${model}_${size}_mode1_iter${i}.txt"
                    if [[ -f "$file" ]]; then
                        time_val=$(grep "Execution time:" "$file" | awk '{print $3}')
                        if [[ ! -z "$time_val" ]]; then
                            exec_times+=($time_val)
                            valid_exec_times=$((valid_exec_times + 1))
                        fi
                    fi
                done
                log_info "Found $valid_exec_times valid execution time measurements for $model (size=$size)"
                
                # Extract throughput values
                throughputs=()
                valid_throughputs=0
                for ((i=1; i<=ITERATIONS; i++)); do
                    file="$RAW_DATA_DIR/$model/${model}_${size}_mode1_iter${i}.txt"
                    if [[ -f "$file" ]]; then
                        throughput_val=$(grep "Throughput:" "$file" | awk '{print $2}')
                        if [[ ! -z "$throughput_val" ]]; then
                            throughputs+=($throughput_val)
                            valid_throughputs=$((valid_throughputs + 1))
                        fi
                    fi
                done
                log_info "Found $valid_throughputs valid throughput measurements for $model (size=$size)"
                
                # Compute statistics for execution time
                if [[ ${#exec_times[@]} -gt 0 ]]; then
                    min_time=$(printf '%s\n' "${exec_times[@]}" | sort -n | head -1)
                    max_time=$(printf '%s\n' "${exec_times[@]}" | sort -n | tail -1)
                    avg_time=$(echo "scale=2; ($(IFS=+; echo "${exec_times[*]}")) / ${#exec_times[@]}" | bc)
                    
                    # Calculate standard deviation for execution time
                    sum_sq_diff=0
                    for t in "${exec_times[@]}"; do
                        diff=$(echo "scale=4; $t - $avg_time" | bc)
                        sq_diff=$(echo "scale=4; $diff * $diff" | bc)
                        sum_sq_diff=$(echo "scale=4; $sum_sq_diff + $sq_diff" | bc)
                    done
                    std_dev_time=$(echo "scale=4; sqrt($sum_sq_diff / ${#exec_times[@]})" | bc)
                    
                    echo "$model,$size,$min_time,$max_time,$avg_time,$std_dev_time" >> "$STATS_DIR/execution_time.csv"
                    log_info "Execution time stats for $model (size=$size): min=$min_time, max=$max_time, avg=$avg_time, std_dev=$std_dev_time"
                fi
                
                # Compute statistics for throughput
                if [[ ${#throughputs[@]} -gt 0 ]]; then
                    min_tp=$(printf '%s\n' "${throughputs[@]}" | sort -n | head -1)
                    max_tp=$(printf '%s\n' "${throughputs[@]}" | sort -n | tail -1)
                    avg_tp=$(echo "scale=2; ($(IFS=+; echo "${throughputs[*]}")) / ${#throughputs[@]}" | bc)
                    
                    # Calculate standard deviation for throughput
                    sum_sq_diff=0
                    for t in "${throughputs[@]}"; do
                        diff=$(echo "scale=4; $t - $avg_tp" | bc)
                        sq_diff=$(echo "scale=4; $diff * $diff" | bc)
                        sum_sq_diff=$(echo "scale=4; $sum_sq_diff + $sq_diff" | bc)
                    done
                    std_dev_tp=$(echo "scale=4; sqrt($sum_sq_diff / ${#throughputs[@]})" | bc)
                    
                    echo "$model,$size,$min_tp,$max_tp,$avg_tp,$std_dev_tp" >> "$STATS_DIR/throughput.csv"
                    log_info "Throughput stats for $model (size=$size): min=$min_tp, max=$max_tp, avg=$avg_tp, std_dev=$std_dev_tp"
                fi
            fi
            
            # Process mode 2: User instructions and RDTSC Ticks
            if [[ -f "$RAW_DATA_DIR/$model/${model}_${size}_mode2_iter1.txt" ]]; then
                # Extract user instructions values
                instructions=()
                valid_instructions=0
                for ((i=1; i<=ITERATIONS; i++)); do
                    file="$RAW_DATA_DIR/$model/${model}_${size}_mode2_iter${i}.txt"
                    if [[ -f "$file" ]]; then
                        instr_val=$(grep "User instructions:" "$file" | awk '{print $3}')
                        if [[ ! -z "$instr_val" ]]; then
                            instructions+=($instr_val)
                            valid_instructions=$((valid_instructions + 1))
                        fi
                    fi
                done
                log_info "Found $valid_instructions valid user instruction measurements for $model (size=$size)"
                
                # Extract RDTSC ticks values
                ticks=()
                valid_ticks=0
                for ((i=1; i<=ITERATIONS; i++)); do
                    file="$RAW_DATA_DIR/$model/${model}_${size}_mode2_iter${i}.txt"
                    if [[ -f "$file" ]]; then
                        tick_val=$(grep "Avg. RDTSC Ticks:" "$file" | awk '{print $4}')
                        if [[ ! -z "$tick_val" ]]; then
                            ticks+=($tick_val)
                            valid_ticks=$((valid_ticks + 1))
                        fi
                    fi
                done
                log_info "Found $valid_ticks valid RDTSC tick measurements for $model (size=$size)"
                
                # Compute statistics for user instructions
                if [[ ${#instructions[@]} -gt 0 ]]; then
                    min_instr=$(printf '%s\n' "${instructions[@]}" | sort -n | head -1)
                    max_instr=$(printf '%s\n' "${instructions[@]}" | sort -n | tail -1)
                    avg_instr=$(echo "scale=2; ($(IFS=+; echo "${instructions[*]}")) / ${#instructions[@]}" | bc)
                    
                    # Calculate standard deviation for user instructions
                    sum_sq_diff=0
                    for i in "${instructions[@]}"; do
                        diff=$(echo "scale=4; $i - $avg_instr" | bc)
                        sq_diff=$(echo "scale=4; $diff * $diff" | bc)
                        sum_sq_diff=$(echo "scale=4; $sum_sq_diff + $sq_diff" | bc)
                    done
                    std_dev_instr=$(echo "scale=4; sqrt($sum_sq_diff / ${#instructions[@]})" | bc)
                    
                    echo "$model,$size,$min_instr,$max_instr,$avg_instr,$std_dev_instr" >> "$STATS_DIR/user_instructions.csv"
                    log_info "User instructions stats for $model (size=$size): min=$min_instr, max=$max_instr, avg=$avg_instr, std_dev=$std_dev_instr"
                fi
                
                # Compute statistics for RDTSC ticks
                if [[ ${#ticks[@]} -gt 0 ]]; then
                    min_tick=$(printf '%s\n' "${ticks[@]}" | sort -n | head -1)
                    max_tick=$(printf '%s\n' "${ticks[@]}" | sort -n | tail -1)
                    avg_tick=$(echo "scale=6; ($(IFS=+; echo "${ticks[*]}")) / ${#ticks[@]}" | bc)
                    
                    # Calculate standard deviation for ticks
                    sum_sq_diff=0
                    for t in "${ticks[@]}"; do
                        diff=$(echo "scale=8; $t - $avg_tick" | bc)
                        sq_diff=$(echo "scale=8; $diff * $diff" | bc)
                        sum_sq_diff=$(echo "scale=8; $sum_sq_diff + $sq_diff" | bc)
                    done
                    std_dev_tick=$(echo "scale=8; sqrt($sum_sq_diff / ${#ticks[@]})" | bc)
                    
                    echo "$model,$size,$min_tick,$max_tick,$avg_tick,$std_dev_tick" >> "$STATS_DIR/rdtsc_ticks.csv"
                    log_info "RDTSC ticks stats for $model (size=$size): min=$min_tick, max=$max_tick, avg=$avg_tick, std_dev=$std_dev_tick"
                fi
            fi
            
            current_stat=$((current_stat + 1))
            log_progress $current_stat $total_stats
        done
        
        log_info "Completed statistics computation for model: $model"
        echo ""  # Add a newline after the progress bar
    done
    
    echo ""  # Add a newline after the progress bar
    log_info "Statistics computation completed."
}

# Main execution starts here
log_info "Starting benchmark process..."
mkdir -p "$RESULTS_DIR"

compile_models
run_all_tests
compute_statistics

log_info "Benchmark completed successfully. Results are stored in $RESULTS_DIR directory."