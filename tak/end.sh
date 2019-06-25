#!/bin/bash
echo -e 'end\t'$(date "+%Y\t%m\t%d\t%R") >> record.log
echo end at $(date "+%Y-%m-%dT%T")
