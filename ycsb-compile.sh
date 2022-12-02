#!/bin/bash

cd YCSB
mvn -pl site.ycsb:tweezer-binding -am package
mvn -pl site.ycsb:speicher-binding -am package
