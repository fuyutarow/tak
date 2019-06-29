#!/bin/bash
TAK_DIR=$HOME/.tak
echo -e 'end\t'$(date "+%Y\t%m\t%d\t%R") >> ${TAK_DIR%/}/record.log
echo end at $(date "+%Y-%m-%dT%T")
