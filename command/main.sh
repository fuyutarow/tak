#!/bin/bash

VERSION="0.0.5"

TAK_DIR=$HOME/.tak
CommandDir=$TAK_DIR/command

usage() {
cat<<EOS
Usage: tak <command> [<args>]

  begin       Log record When you start
  start       Alias to start
  end         Log recored what and when you end task
  push        Push to your Google Calendar
  open        Open your Google Calendar with web browser
  branch      Show list of branches
  checkout    Switch branch
  edit        Edit record
  makebranch  Make a new branch
  issue       Open GitHub issue with web browser
  status      Display tak status
  update      Update tak version
EOS
}

Subcommand=$1
shift
case "$Subcommand" in
    'help'|'-h'|'--help'|'')
        usage
        exit 1
        ;;
    '--version')
        echo $VERSION
        exit 1
        ;;
    'status') bash $CommandDir/status.sh ;exit 1;;
    'begin') bash $CommandDir/begin.sh ;exit 1;;
    'start') bash $CommandDir/begin.sh ;exit 1;;
    'end') bash $CommandDir/end.sh ;exit 1;;
    'push') bash $CommandDir/push.sh ;exit 1;;
    'opne') bash $CommandDir/open.sh ;exit 1;;
    'branch') bash $CommandDir/branch.sh ;exit 1;;
    'checkout') bash $CommandDir/checkout.sh $@ ;exit 1;;
    'edit') bash $CommandDir/edit.sh ;exit 1;;
    'issue') bash $CommandDir/issue.sh ;exit 1;;
    'install') bash $TAK_DIR/scripts/install.sh ;exit 1;;
    'update') bash $TAK_DIR/scripts/update.sh ;exit 1;;
    'makebranch') bash $CommandDir/makebranch.sh ;exit 1;;
    -*)
        echo "tak: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
        exit 1
        ;;
    *)
        if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
            #param=( ${param[@]} "$1" )
            param+=( "$1" )
            shift 1
        fi
        ;;
esac
