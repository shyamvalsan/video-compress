#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it and try again."
    exit 1
fi

# Check if input files are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_video1> [input_video2] ..."
    exit 1
fi

# Function to compress video
compress_video() {
    input_file="$1"
    output_file="${input_file%.*}_compressed.mp4"

    ffmpeg -i "$input_file" \
        -c:v libx264 \
        -preset slow \
        -crf 23 \
        -c:a aac \
        -b:a 128k \
        -movflags +faststart \
        -vf "scale=-2:720" \
        "$output_file"

    # Calculate compression ratio
    original_size=$(stat -f%z "$input_file")
    compressed_size=$(stat -f%z "$output_file")
    ratio=$(echo "scale=2; (1 - $compressed_size / $original_size) * 100" | bc)
    
    echo "Compression complete for $input_file"
    echo "Compression ratio: $ratio%"
}

# Process each input file
for input_file in "$@"; do
    if [ ! -f "$input_file" ]; then
        echo "Error: File not found - $input_file"
        continue
    fi
    
    compress_video "$input_file"
done

echo "All files processed."
