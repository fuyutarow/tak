#!/bin/bash
TAK_DIR=$HOME/.tak
status_info=${TAK_DIR%/}/status/info.toml
status_commit=${TAK_DIR%/}/status/commit.toml
status_branch=${TAK_DIR%/}/status/branch.toml
branch=$(cat $status_branch | grep name | awk -F\" '{print $2}')
branch_dir=${TAK_DIR%/}/branches/${branch%/}

echo "`cat <<EOM
stop = $(date "+%Y-%m-%dT%R")
EOM
`" >> $status_commit

echo >> "${branch_dir%/}/record.toml"
cat $status_commit >> "${branch_dir%/}/record.toml"
echo '' > $status_commit


echo "`cat <<EOM
[info]
checkpoint = $(date +%s)
status = "idle"
EOM
`" > $status_info

echo stop at $(date "+%Y-%m-%dT%T")
