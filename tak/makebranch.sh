#!/bin/bash

COMMAND_DIR=$(cd $(dirname ${0}); pwd)
REPO_DIR=$COMMAND_DIR/..
TAK_DIR=$REPO_DIR/.tak

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
    mkdir -p $TAK_DIR/$BranchName
    echo "$Config" > $TAK_DIR/$BranchName/config.toml
else
    :
fi
