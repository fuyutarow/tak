#!/bin/bash
TAK_DIR=$HOME/.tak

echo "`cat <<EOM
stop = $(date "+%Y-%m-%dT%R")
EOM
`" >> ${TAK_DIR%/}/current.toml
cat current.toml >> ${TAK_DIR%/}/record.toml
echo '' > current.toml


echo "`cat <<EOM
[info]
checkpoint = $(date +%s)
status = "idle"
EOM
`" > ${TAK_DIR%/}/status.toml

echo stop at $(date "+%Y-%m-%dT%T")
