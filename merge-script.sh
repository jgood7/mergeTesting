#!/bin/bash

base="$1"
head="$2"
merge="$3"

# Perform a three-way merge using diff3
diff3 -m "$merge" "$base" "$head" > merged_file.java

# Check for conflict markers in the output
if grep -q '<<<<<<<' merged_file.java; then
    # Check for deletion conflicts
    if grep -q '=======\|>>>>>>>' merged_file.java; then
        echo "Deletion conflict detected in merged_file.java. Manual review required."
        exit 1
    else
        # Automatically resolve addition conflicts by accepting both additions
        sed -e '/^<<<<<<< /d' -e '/^=======/d' -e '/^>>>>>>> /d' merged_file.java > resolved_file.java
        echo "Addition conflict resolved automatically: resolved_file.java"
        cp resolved_file.java "$merge"
        exit 0
    fi
else
    echo "Merge successful: merged_file.java"
    cp merged_file.java "$merge"
    exit 0
fi
