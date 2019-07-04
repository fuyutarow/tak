#!/bin/bash
TAK_DIR=$HOME/.tak
echo "end = $(date "+%Y-%m-%dT%R")" >> ${TAK_DIR%/}/record.toml
echo end at $(date "+%Y-%m-%dT%T")

function setTime() {
  echo checkpoint = `date +%s` > ${TAK_DIR%/}/status.toml
}

setTime
