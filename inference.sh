#!/bin/bash
OUTPUT="/data/output/$(date +%s).jpg"
#script
/home/ubuntu/torch/install/bin/th slow_neural_style.lua $@ -output_image "$OUTPUT"

echo $OUTPUT
