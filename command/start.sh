#!/bin/bash
TAK_DIR=$HOME/.tak

read -p "What: " what
read -p "Where: " where

# echo -e 'start\t'$(date "+%Y\t%m\t%d\t%R") >> ${TAK_DIR%/}/record.log


echo "
[[commits]]
start = $(date "+%Y-%m-%dT%R")
what = $what
where = $where" >> ${TAK_DIR%/}/record.toml
