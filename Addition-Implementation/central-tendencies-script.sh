#!/bin/bash

# Check if a file name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <csv_file>"
    exit 1
fi

# File name from command-line argument
file="$1"

# Read the header
header=$(head -n 1 "$file")

# Initialize arrays to store sums, sums of squares, min, and max
declare -A sum
declare -A sumsq
declare -A min
declare -A max
declare -A count

# Initialize arrays with initial values
IFS=',' read -r -a columns <<< "$header"
for col in "${columns[@]}"; do
    sum[$col]=0
    sumsq[$col]=0
    min[$col]=INF
    max[$col]=-INF
    count[$col]=0
done

# Process the CSV file
awk -F, -v header="$header" '
BEGIN {
    split(header, colnames, ",");
    for (i in colnames) {
        sum[i] = 0;
        sumsq[i] = 0;
        min[i] = "INF";
        max[i] = -1 * (1/0);
        count[i] = 0;
    }
}
NR > 1 {
    for (i = 1; i <= NF; i++) {
        sum[i] += $i;
        sumsq[i] += ($i)^2;
        if (min[i] == "INF" || $i < min[i]) min[i] = $i;
        if ($i > max[i]) max[i] = $i;
        count[i]++;
    }
}
END {
    for (i = 1; i <= length(colnames); i++) {
        if (count[i] > 0) {
            avg = sum[i] / count[i];
            stddev = sqrt((sumsq[i] / count[i]) - (avg)^2);
            printf "%s: min=%.2f, avg=%.2f, max=%.2f, stddev=%.2f\n", colnames[i], min[i], avg, max[i], stddev;
        } else {
            printf "%s: No data\n", colnames[i];
        }
    }
}' "$file"