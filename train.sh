export LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64
export PATH=$PATH:/usr/local/cuda-7.5/bin
/home/ubuntu/torch/install/bin/th train.lua $@ -checkpoint_name model
