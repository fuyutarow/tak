#!/bin/bash

COMMAND_DIR=$(cd $(dirname ${0}); pwd)
REPO_DIR=$COMMAND_DIR/..
TAK_DIR=$REPO_DIR/.tak


CurrentBranch=$(cat $REPO_DIR/config.tml | grep name | cut -f3 -d' ' | cut -f2 -d'"')

if [ $# -ne 1 ]; then
  echo "Branch name is required as argument." 1>&2
  exit 1
fi
Filename=$(ls $TAK_DIR | grep $1 | head -1)
TargetBranch="${Filename%.*}"

cat $REPO_DIR/config.tml > $TAK_DIR/$CurrentBranch/config.toml
cat $REPO_DIR/record.log > $TAK_DIR/$CurrentBranch/record.log
cat $REPO_DIR/record.archived.log > $TAK_DIR/$CurrentBranch/record.archived.log

cat $TAK_DIR/$TargetBranch/config.toml > $REPO_DIR/config.tml
cat $TAK_DIR/$TargetBranch/record.log > $REPO_DIR/record.log
cat $TAK_DIR/$TargetBranch/record.archived.log > $REPO_DIR/record.archived.log

echo Checkout $TargetBranch
