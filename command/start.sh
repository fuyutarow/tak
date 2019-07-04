#!/bin/bash
TAK_DIR=$HOME/.tak

read -p "What: " What
read -p "Where: " Where

echo "`cat <<EOM

[[commits]]
start = $(date "+%Y-%m-%dT%R")
what = "$What"
where = "$Where"
EOM
`" >> ${TAK_DIR%/}/record.toml

function setStarttime() {
  echo `date +%s` > ${TAK_DIR%/}/timer.txt
}

setStarttime
