#!/bin/bash
TAK_DIR=$HOME/.tak
echo "end = $(date "+%Y-%m-%dT%R")" >> ${TAK_DIR%/}/record.toml
echo end at $(date "+%Y-%m-%dT%T")


echo "`cat <<EOM
[info]
checkpoint = $(date +%s)
status = "idle"
EOM
`" > ${TAK_DIR%/}/status.toml
