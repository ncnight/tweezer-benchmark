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
Replace the first arg of -v for mounting a host machine folder.
```bash
source tweezer/script/determine_sgx_device.sh && determine_sgx_device
docker run --rm -v=/var/rocksdb-storage/tweezer:/tmp/db-storage $MOUNT_SGXDEVICE --name ycsb ycsb-setup:0.0 /bin/bash ./runtweezer.sh
docker run --rm -v=/var/rocksdb-storage/speicher:/tmp/db-storage $MOUNT_SGXDEVICE --name ycsb ycsb-setup:0.0 /bin/bash ./runspeicher.sh
```
To change the config, just add it to the corresponding YCSB project folder, modify the runspeicher or runtweezer scripts to incorporate args, rebuild the docker image (should be quick). Run above.
