#!/bin/bash
TAK_DIR=$HOME/.tak
status_branch=${TAK_DIR%/}/status/branch.toml
branch=$(cat $status_branch | grep name | awk -F\" '{print $2}')
branch_dir=${TAK_DIR%/}/branches/${branch%/}

vim ${branch_dir%/}/record.toml
