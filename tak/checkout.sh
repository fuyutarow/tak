#!/bin/bash

COMMAND_DIR=$(cd $(dirname ${0}); pwd)
REPO_DIR=$COMMAND_DIR/../
TAK_DIR=$REPO_DIR/.tak


if [ $# -ne 1 ]; then
  echo "$# arguments are required" 1>&2
  exit 1
fi
BranchName=$1

Filename=$(ls $TAK_DIR | grep $1 | head -1)
BranchName="${Filename%.*}"

echo $BranchName

cat $TAK_DIR/$BranchName.toml > $REPO_DIR/Config.tml
