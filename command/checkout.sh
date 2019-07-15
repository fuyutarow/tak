#!/bin/bash

TAK_DIR=$HOME/.tak
COMMAND_DIR=$(cd $(dirname ${0}); pwd)
status_branch=${TAK_DIR%/}/status/branch.toml

CurrentBranch=$(cat $status_branch | grep name | awk -F\" '{print $2}')


if [ $# -ne 1 ]; then
  echo "❌ Branch name is required as argument." 1>&2
  exit 1
fi

Filename=$(ls ${TAK_DIR%/}/branches | grep $1 | head -1)
TargetBranch="${Filename%.*}"


if [ -n "$TargetBranch" ]; then
  :
else
  echo "❌ $1: No such branch."
  exit 1
fi

SrcDir=${TAK_DIR%/}/branches/${TargetBranch%/}
cat $SrcDir/config.toml > $status_branch

echo ✅ Checkout $TargetBranch
# ⚠️
