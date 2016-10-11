#!/bin/bash
OUTPUT="/data/output/$(date +%s).jpg"
#script
/home/ubuntu/torch/install/bin/th fast_neural_style.lua $@ -gpu 0 -output_image "$OUTPUT"

echo $OUTPUT
