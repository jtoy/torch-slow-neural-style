FROM somatic/k802x
#FROM kaixhin/cuda-torch
ENV DEBIAN_FRONTEND noninteractive

RUN git clone https://github.com/torch/distro.git /home/ubuntu/torch --recursive
RUN cd /home/ubuntu/torch; bash install-deps;
RUN cd /home/ubuntu/torch; ./install.sh

RUN /home/ubuntu/torch/install/bin/luarocks install loadcaffe

RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install torch

RUN cd /tmp && wget https://cl.ly/1r0Z301h443l/download/cudnn-7.5-linux-x64-v5.0-ga.tgz
RUN cd /usr/local &&tar xzvf /tmp/cudnn-7.5-linux-x64-v5.0-ga.tgz
RUN ldconfig


RUN /home/ubuntu/torch/install/bin/luarocks install image
RUN /home/ubuntu/torch/install/bin/luarocks install lua-cjson
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install nn
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cutorch
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cunn


RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cudnn

RUN /home/ubuntu/torch/install/bin/luarocks install https://raw.githubusercontent.com/deepmind/torch-hdf5/master/hdf5-0-0.rockspec
