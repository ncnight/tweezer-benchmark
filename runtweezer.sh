#!/bin/bash
cd db_benchmarks
TEST_TMPDIR=/tmp/db-storage ./tweezer_bench

rm /tmp/db-storage/*
