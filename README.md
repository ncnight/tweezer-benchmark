### Simple repo for setting up the YCSB benchmark with tweezer and speicher

To get source:
```bash
git clone https://github.com/ncnight/tweezer-benchmark.git
cd tweezer-benchmark
git submodule update --init --recursive
```

Build docker image:
```bash 
docker build -t ycsb-benchmark:0.0 ./
```
Building compiles tweezer and speicher. To make config changes in YCSB, just rerun the image building command and compilation should be cached.

Run YCSB:

```bash
source tweezer/script/determine_sgx_device.sh && determine_sgx_device
docker run $MOUNT_SGXDEVICE --name ycsb ycsb-benchmark:0.0 /root/YCSB/bin/ycsb load tweezer -s -P workload/$WORKLOAD -p tweezer.dir=/root/tweezer-ycsb
```
