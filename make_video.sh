#!/bin/bash

# Check if input image is provided
if [ -z "$1" ]; then
    echo "Usage: ./make_video.sh <input_image>"
    exit 1
fi

INPUT_IMAGE="$1"
OUTPUT_VIDEO="${INPUT_IMAGE%.*}.mp4"

# Create a 10-second video from the input image using ffmpeg
ffmpeg -loop 1 -i "$INPUT_IMAGE" -c:v libx264 -t 10 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -y "$OUTPUT_VIDEO"

echo "Video saved as $OUTPUT_VIDEO"
