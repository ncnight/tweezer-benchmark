FROM ubuntu:22.04

ADD tweezer /root/tweezer
WORKDIR /root

RUN apt update && apt install git build-essential cmake -y
RUN git clone https://github.com/gflags/gflags.git && && cd gflags && mkdir build && cd build && cmake .. && make install
RUN git clone https://github.com/google/snappy.git && cd snappy && mkdir build && cd build && cmake -DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=OFF .. && make install

RUN git clone -b OpenSSL_1_1_1i https://github.com/openssl/openssl.git
RUN apt install zlib1g-dev libbz2-dev liblz4-dev libzstd-dev curl mlocate openjdk-11-jdk openjdk-11-jre maven python2 vim libgflags-dev libssl-dev libsnappy-dev -y

ADD setup.sh /root/setup.sh
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN chmod +x setup.sh && ./setup.sh
ADD compile.sh /root/compile.sh
RUN chmod +x compile.sh && ./compile.sh
ADD YCSB /root/YCSB
ADD ycsb-compile.sh /root/ycsb-compile.sh
RUN chmod +x ycsb-compile.sh && ./ycsb-compile.sh
