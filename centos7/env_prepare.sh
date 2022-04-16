#!/bin/bash

yum update
yum install -y wget

if [ ! -d "/env/app" ]; then
  mkdir -p /env/app
fi
echo "install conda"
bash /env/app/miniconda.sh -b -p $HOME/miniconda
~/miniconda/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
echo 'Successfully installed miniconda...'
echo -n 'Conda version: '
~/miniconda/bin/conda --version
echo -e '\n'

source ~/miniconda/bin/activate

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/

conda config --set show_channel_urls yes

conda install -c conda-forge openssl=1.1.1
conda install -c conda-forge cmake=3.19.1
conda install -c conda-forge gflags=2.2.2
conda install -c conda-forge sysroot_linux-64=2.17
conda install -c conda-forge leveldb=1.22
conda install -c conda-forge faiss=1.7.1
conda install -c conda-forge protobuf=3.12.4
conda install -c conda-forge boost
