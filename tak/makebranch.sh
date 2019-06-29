#!/bin/bash

TAK_DIR=$HOME/.tak
COMMAND_DIR=$(cd $(dirname ${0}); pwd)

# open "https://calendar.google.com/calendar/r/settings/createcalendar"

read -p "CalendarId: " CalendarId
read -p "New branch name: " BranchName

# trim white space
BranchName="$(echo -e "${BranchName}" | tr -d '[:space:]')"

Config=`cat <<EOM
[core]
name = "$BranchName"

[calendar]
id = "$CalendarId"
EOM
`

echo "$Config"

read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    BranchDir=${TAK_DIR%/}/branches/$BranchName
    mkdir -p $BranchDir
    echo "$Config" > ${BranchDir%/}/config.toml
    touch ${BranchDir%/}/record.log
    touch ${BranchDir%/}/record.archived.log
else
    :
fi
