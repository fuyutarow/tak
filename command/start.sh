#!/bin/bash
TAK_DIR=$HOME/.tak
CommandDir=$TAK_DIR/command
status_info=${TAK_DIR%/}/status/info.toml
status_commit=${TAK_DIR%/}/status/commit.toml
status_branch=${TAK_DIR%/}/status/branch.toml
branch=$(cat $status_branch | grep name | awk -F\" '{print $2}')
branch_dir=${TAK_DIR%/}/branches/${branch%/}

read -p "Where: " Where
read -p "What: " What

if [ -z "$What" ]; then
  What=''
fi

function stopCommitIfActive() {
  tak_status=$(cat $status_info | grep status | awk -F\" '{print $2}')

  if [ "$tak_status" = "active" ]; then
    bash $CommandDir/stop.sh
  fi
}

function writeInfo() {
echo "`cat <<EOM
[info]
checkpoint = $(date +%s)
status = "active"
EOM
`" > $status_info
}

function writeCommit() {
echo "`cat <<EOM
[[commits]]
start = $(date "+%Y-%m-%dT%R")
where = "$Where"
what = """
$What
"""
EOM
`" > $status_commit
}

stopCommitIfActive
writeInfo
writeCommit
