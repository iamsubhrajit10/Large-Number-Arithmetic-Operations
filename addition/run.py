#!/usr/bin/env python3

import os
import subprocess
import re
import numpy as np
import csv
import datetime
import sys
import time
import traceback
import io
from collections import defaultdict

# Define constants
OPERAND_SIZES = [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072]
MODES = [1, 2]
ITERATIONS = 10
CORE = 0
BASE_DIR = os.getcwd()

# Set up directory structure
RESULTS_DIR = os.path.join(BASE_DIR, "performance_results")
RAW_DATA_DIR = os.path.join(RESULTS_DIR, "raw_data")
STATS_DIR = os.path.join(RESULTS_DIR, "stats")

# Model information with proper compile and run commands
MODELS = {
    "baseline": {
        "compile": "gcc add.c limb_utils.c perf_utils.c -o add -lz -I. -O1 -fno-tree-vectorize",
        "dir": os.path.join(BASE_DIR, "baseline")
    },
    "gmp": {
        "compile": "gcc add.c ../utils/perf_utils.c -o add -lgmp -lz -I../utils -O1 -mavx512f -mavx512vl",
        "dir": os.path.join(BASE_DIR, "gmp")
    },
    "pml_add": {
        "compile": "gcc add.c ../utils/perf_utils.c ../utils/limb_utils.c -o add -lz -I../utils -O1 -mavx512f -mavx512vl",
        "dir": os.path.join(BASE_DIR, "pml_add")
    },
    "pml_add_approx": {
        "compile": "gcc add.c ../utils/perf_utils.c ../utils/limb_utils.c -o add -lz -I../utils -O1 -mavx512f -mavx512vl",
        "dir": os.path.join(BASE_DIR, "pml_add_approx")
    }
}

# Pre-compiled regex patterns for better performance
REGEX_PATTERNS = {
    "execution_time": re.compile(r"Execution time: (\d+\.?\d*)"),
    "throughput": re.compile(r"Throughput: (\d+)"),
    "user_instructions": re.compile(r"User instructions: (\d+)"),
    "rdtsc_ticks": re.compile(r"Avg. RDTSC Ticks: (\d+\.?\d*)")
}

# Buffer for logging
log_buffer = io.StringIO()
BUFFER_THRESHOLD = 4096  # Flush after this many bytes

# Buffered logging functions
def flush_logs():
    """Flush the log buffer to stdout"""
    content = log_buffer.getvalue()
    if content:
        sys.stdout.write(content)
        sys.stdout.flush()
        log_buffer.seek(0)
        log_buffer.truncate()

def log_info(message):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_buffer.write(f"[{timestamp}] [INFO] {message}\n")
    if log_buffer.tell() > BUFFER_THRESHOLD:
        flush_logs()

def log_error(message):
    # Error messages bypass buffer for immediate display
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] [ERROR] {message}", file=sys.stderr)

def log_warning(message):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_buffer.write(f"[{timestamp}] [WARNING] {message}\n")
    if log_buffer.tell() > BUFFER_THRESHOLD:
        flush_logs()

def log_debug(message):
    if os.environ.get("DEBUG"):
        timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_buffer.write(f"[{timestamp}] [DEBUG] {message}\n")
        if log_buffer.tell() > BUFFER_THRESHOLD:
            flush_logs()

def log_progress(current, total, label="Progress"):
    percent = int(current * 100 / total)
    bar_size = 40
    bar_complete = int(percent * bar_size / 100)
    bar = "#" * bar_complete + " " * (bar_size - bar_complete)
    sys.stdout.write(f"\r{label}: [{bar}] {percent:3d}% ({current}/{total})")
    sys.stdout.flush()

# Create output directories
def create_directories():
    log_info("Creating output directories...")
    os.makedirs(RESULTS_DIR, exist_ok=True)
    os.makedirs(STATS_DIR, exist_ok=True)
    
    for model in MODELS.keys():
        os.makedirs(os.path.join(RAW_DATA_DIR, model), exist_ok=True)
    
    # Initialize CSV files with headers
    metrics = ["execution_time", "throughput", "user_instructions", "rdtsc_ticks"]
    for metric in metrics:
        with open(os.path.join(STATS_DIR, f"{metric}.csv"), "w") as f:
            f.write("model,operand_size,min,max,avg,std_dev\n")
    
    flush_logs()

# Compile all models
def compile_models():
    log_info("Compiling all models...")
    
    for model_name, model_info in MODELS.items():
        log_info(f"Compiling {model_name} model...")
        
        try:
            os.chdir(model_info["dir"])
            result = subprocess.run(model_info["compile"], shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
            
            if result.returncode == 0:
                log_info(f"{model_name} model compiled successfully")
            else:
                log_error(f"Failed to compile {model_name} model")
                log_error(f"Error: {result.stderr.decode('utf-8')}")
                sys.exit(1)
                
        except Exception as e:
            log_error(f"Exception while compiling {model_name}: {str(e)}")
            log_error(traceback.format_exc())
            sys.exit(1)
    
    os.chdir(BASE_DIR)
    log_info("All models compiled successfully.")
    flush_logs()

# Run a single test with buffered output
def run_test(model, size, mode, iteration):
    output_file = os.path.join(RAW_DATA_DIR, model, f"{model}_{size}_mode{mode}_iter{iteration}.txt")
    
    try:
        os.chdir(MODELS[model]["dir"])
        log_debug(f"Running {model}: size={size}, mode={mode}, iteration={iteration}")
        
        cmd = f"sudo taskset -c {CORE} ./add {size} 0 0 2 {mode}"
        
        # Run the command with timeout
        process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate(timeout=60)  # 60-second timeout
        
        if process.returncode == 0:
            # Write directly to file without reading it back
            with open(output_file, "wb") as f:
                f.write(stdout)
            
            # Check content without re-reading the file
            content = stdout.decode('utf-8')
            if mode == 1 and "Execution time:" not in content:
                log_warning(f"No execution time found in output for {model} (size={size}, mode={mode}, iteration={iteration})")
            elif mode == 2 and "User instructions:" not in content:
                log_warning(f"No user instructions found in output for {model} (size={size}, mode={mode}, iteration={iteration})")
                
        else:
            log_error(f"Command failed with return code {process.returncode}")
            log_error(f"STDERR: {stderr.decode('utf-8')}")
            
    except subprocess.TimeoutExpired:
        log_error(f"Timeout running test for {model} (size={size}, mode={mode}, iteration={iteration})")
        try:
            process.kill()
        except:
            pass
            
    except Exception as e:
        log_error(f"Exception running test for {model} (size={size}, mode={mode}, iteration={iteration}): {str(e)}")
        log_error(traceback.format_exc())
    
    finally:
        # Always return to base directory, even if there was an error
        os.chdir(BASE_DIR)

# Run all tests sequentially with buffered logging
def run_all_tests():
    log_info("Running all tests...")
    
    # Calculate total number of tests
    total_tests = len(OPERAND_SIZES) * len(MODES) * ITERATIONS * len(MODELS)
    current_test = 0
    
    try:
        for model in MODELS.keys():
            log_info(f"Starting tests for model: {model}")
            flush_logs()  # Flush logs at the start of each model
            
            for size in OPERAND_SIZES:
                for mode in MODES:
                    # Flush logs periodically to keep console updated
                    if current_test % 10 == 0:
                        flush_logs()
                        
                    for iteration in range(1, ITERATIONS + 1):
                        run_test(model, size, mode, iteration)
                        current_test += 1
                        log_progress(current_test, total_tests, "Test progress")
            
            log_info(f"Completed all tests for model: {model}")
            print("")  # Add a newline after the progress bar
            flush_logs()  # Ensure logs are flushed after each model
        
        print("")  # Add a newline after the progress bar
        log_info("All tests completed successfully.")
        flush_logs()
        
    except Exception as e:
        log_error(f"Exception in run_all_tests: {str(e)}")
        log_error(traceback.format_exc())
        sys.exit(1)

# Calculate statistics with optimized file I/O
def compute_statistics():
    log_info("Computing statistics...")
    
    # Metrics mapping
    metrics = {
        "execution_time": {"mode": 1, "precision": 4},
        "throughput": {"mode": 1, "precision": 2},
        "user_instructions": {"mode": 2, "precision": 2},
        "rdtsc_ticks": {"mode": 2, "precision": 8}
    }
    
    # Prepare CSV data collectors for batch writing
    csv_data = {metric: [] for metric in metrics}
    
    total_stats = len(OPERAND_SIZES) * len(MODELS)
    current_stat = 0
    
    for model in MODELS.keys():
        log_info(f"Computing statistics for model: {model}")
        flush_logs()
        
        for size in OPERAND_SIZES:
            # Store all data for this size and model
            size_data = {}
            
            # Read all files for this size and model in one batch
            for metric_name, metric_info in metrics.items():
                mode = metric_info["mode"]
                values = []
                
                for iteration in range(1, ITERATIONS + 1):
                    file_path = os.path.join(RAW_DATA_DIR, model, f"{model}_{size}_mode{mode}_iter{iteration}.txt")
                    
                    if not os.path.isfile(file_path):
                        continue
                    
                    try:
                        # Read file once and extract all patterns
                        with open(file_path, "r") as f:
                            content = f.read()
                            
                        # Use pre-compiled regex
                        match = REGEX_PATTERNS[metric_name].search(content)
                        if match:
                            values.append(float(match.group(1)))
                        
                    except Exception as e:
                        log_error(f"Error processing {file_path}: {str(e)}")
                
                size_data[metric_name] = values
            
            # Compute statistics for all metrics for this size
            for metric_name, values in size_data.items():
                if values:
                    # Calculate statistics efficiently
                    min_val = min(values)
                    max_val = max(values)
                    avg_val = sum(values) / len(values)
                    std_dev = np.std(values, ddof=1) if len(values) > 1 else 0
                    
                    # Format with appropriate precision
                    precision = metrics[metric_name]["precision"]
                    min_val = round(min_val, precision)
                    max_val = round(max_val, precision)
                    avg_val = round(avg_val, precision)
                    std_dev = round(std_dev, precision)
                    
                    # Add to batch write collection
                    csv_data[metric_name].append(f"{model},{size},{min_val},{max_val},{avg_val},{std_dev}")
                    
                    log_debug(
                        f"{metric_name.capitalize().replace('_', ' ')} stats for {model} "
                        f"(size={size}): min={min_val}, max={max_val}, avg={avg_val}, std_dev={std_dev}"
                    )
            
            current_stat += 1
            log_progress(current_stat, total_stats, "Stats progress")
            
            # Flush logs every few sizes
            if current_stat % 5 == 0:
                flush_logs()
        
        log_info(f"Completed statistics computation for model: {model}")
        print("")  # Add a newline after the progress bar
    
    # Batch write all CSV data at once
    for metric_name, rows in csv_data.items():
        if rows:
            with open(os.path.join(STATS_DIR, f"{metric_name}.csv"), "a") as f:
                f.write("\n".join(rows) + "\n")
    
    print("")  # Add a newline after the progress bar
    log_info("Statistics computation completed.")
    flush_logs()

# Main function
def main():
    start_time = time.time()
    log_info(f"Starting benchmark process at {datetime.datetime.now()}")
    
    try:
        create_directories()
        compile_models()
        run_all_tests()
        compute_statistics()
        
        elapsed_time = time.time() - start_time
        log_info(f"Benchmark completed successfully in {elapsed_time:.2f} seconds")
        log_info(f"Results are stored in {RESULTS_DIR} directory")
        flush_logs()
        
    except Exception as e:
        log_error(f"Benchmark failed: {str(e)}")
        log_error(traceback.format_exc())
        return 1
        
    return 0

if __name__ == "__main__":
    try:
        sys.exit(main())
    finally:
        # Ensure logs are flushed even if the program exits unexpectedly
        flush_logs()