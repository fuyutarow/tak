#!/bin/bash

TAK_DIR=$HOME/.tak
COMMAND_DIR=$(cd $(dirname ${0}); pwd)

CurrentBranch=$(cat ${TAK_DIR%/}/config.tml | grep name | cut -f3 -d' ' | cut -f2 -d'"')


if [ $# -ne 1 ]; then
  echo "❌ Branch name is required as argument." 1>&2
  exit 1
fi
Filename=$(ls ${TAK_DIR%/}/branches | grep $1 | head -1)
TargetBranch="${Filename%.*}"

SrcDir=$TAK_DIR
DstDir=${TAK_DIR%/}/branches/${CurrentBranch%/}
cat $SrcDir/config.tml > $DstDir/config.toml
cat $SrcDir/record.toml > $DstDir/record.toml
cat $SrcDir/record.log > $DstDir/record.log
cat $SrcDir/record.archived.log > $DstDir/record.archived.log

SrcDir=${TAK_DIR%/}/branches/${TargetBranch%/}
DstDir=$TAK_DIR
cat $SrcDir/config.toml > $DstDir/config.tml
cat $SrcDir/record.toml > $DstDir/record.toml
cat $SrcDir/record.log > $DstDir/record.log
cat $SrcDir/record.archived.log > $DstDir/record.archived.log

echo ✅ Checkout $TargetBranch
# ⚠️
