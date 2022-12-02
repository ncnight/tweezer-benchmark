#!/bin/bash
cd YCSB
mvn -pl site.ycsb:tweezer-binding -am package
bin/ycsb load tweezer -s -P workloads/workloada -p tweezer.dir=/tmp/db-storage
