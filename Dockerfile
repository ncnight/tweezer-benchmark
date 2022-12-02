FROM ubuntu:22.04

ADD tweezer /root/tweezer
ADD YCSB /root/YCSB
WORKDIR /root
# ENV CC /opt/scone/cross-compiler/x86_64-linux-musl/bin/x86_64-linux-musl-gcc
# ENV CXX /opt/scone/cross-compiler/x86_64-linux-musl/bin/x86_64-linux-musl-g++
RUN echo $CXX

RUN apt update && apt install git build-essential cmake -y
RUN git clone https://github.com/gflags/gflags.git && cd gflags && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/opt/scone/cross-compiler/x86_64-linux-musl .. && make install
RUN git clone https://github.com/google/snappy.git && cd snappy && mkdir build && cd build && cmake -DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=OFF .. && make install

RUN git clone -b OpenSSL_1_1_1i https://github.com/openssl/openssl.git
RUN apt install zlib1g-dev libbz2-dev liblz4-dev libzstd-dev curl mlocate openjdk-11-jdk openjdk-11-jre maven python2 vim -y

ADD setup.sh /root/setup.sh
ADD ld-testing /root/ld-testing
RUN chmod +x setup.sh && ./setup.sh
