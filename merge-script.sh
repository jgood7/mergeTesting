#!/bin/bash

base="$1"
head="$2"
merge="$3"

# Perform a three-way merge using diff3
diff3 -m "$base" "$head" "$merge" > merged_file.java

# Check for conflict markers in the output
if grep -q '<<<<<<<' merged_file.java; then
    echo "Conflict detected in merged_file.java. Manual review required."
    exit 1
else
    echo "Merge successful: merged_file.java"
    cp merged_file.java "$merge"
fi
