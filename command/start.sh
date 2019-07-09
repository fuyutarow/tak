#!/bin/bash
TAK_DIR=$HOME/.tak

read -p "Where: " Where
read -p "What: " What

if [ -z "$What" ]; then
  What=''
fi

echo "`cat <<EOM

[[commits]]
start = $(date "+%Y-%m-%dT%R")
where = "$Where"
what = """
$What
EOM
`" >> ${TAK_DIR%/}/record.toml

echo "`cat <<EOM
[info]
checkpoint = $(date +%s)
status = "active"
EOM
`" > ${TAK_DIR%/}/status.toml

echo "`cat <<EOM
start = $(date "+%Y-%m-%dT%R")
where = "$Where"
what = """
$What
"""
EOM
`" > ${TAK_DIR%/}/current.toml
