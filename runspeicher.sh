#!/bin/bash
cd db_benchmarks
TEST_TMPDIR=/tmp/db-storage ./speicher_bench

rm /tmp/db-storage/*
