#!/bin/bash

if [ ! -d "/env/app" ]; then
  mkdir -p /env/app
fi

###
# cmake

cd /env/app/
if [ ! -f "cmake-3.20.0-rc3.tar.gz" ]; then
    wget https://cmake.org/files/v3.20/cmake-3.20.0-rc3.tar.gz
fi
tar xf cmake-3.20.0-rc3.tar.gz
cd cmake-3.20.0-rc3
./bootstrap
make
make install
cd /usr/bin
if [ ! -f "cmake" ]; then
    ln -s /usr/local/bin/cmake cmake
fi


###
# faiss

cd /env/app
if [ ! -f "faiss-v1.7.2.tar.gz" ]; then
    wget  https://github.com/facebookresearch/faiss/archive/v1.7.2.tar.gz -O faiss-v1.7.2.tar.gz
fi

tar -xzf faiss-v1.7.2.tar.gz
cd faiss-1.7.2
mkdir build && cd build
cmake .. -DFAISS_ENABLE_GPU=OFF -DFAISS_ENABLE_PYTHON=OFF -DBUILD_TESTING=OFF
make && make install

###
# rocksdb

cd /env/app
if [ ! -f "rocksdb-v6.19.3.tar.gz" ]; then
    wget https://github.com/facebook/rocksdb/archive/v6.19.3.tar.gz -O rocksdb-v6.19.3.tar.gz
fi
tar -xzf rocksdb-v6.19.3.tar.gz
cd rocksdb-6.19.3
mkdir build && cd build
cmake .. -DWITH_TESTS=OFF -DWITH_TOOLS=OFF -DWITH_BENCHMARK_TOOLS=OFF -DWITH_CORE_TOOLS=OFF -DWITH_ALL_TESTS=OFF
make