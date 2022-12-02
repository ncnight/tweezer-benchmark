#!/bin/bash
cd YCSB
mvn -pl site.ycsb:speicher-binding -am clean package
bin/ycsb load speicher -s -P workloads/workloada -p speicher.dir=/tmp/db-storage
