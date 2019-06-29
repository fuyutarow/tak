#!/bin/bash

VERSION="0.0.3"

TAG_DIR=$HOME/.tak
CommandDir=$TAG_DIR/command

usage() {
cat<<EOS
Usage: tak <command> [<args>]

  start       Log record When you start
  commit      Log recored what and where you do
  end         Log recored what and when you end task
  push        Push to your Google Calendar
  open        Open your Google Calendar with web browser
  branch      Show list of branches
  checkout    Switch branch
  edit        Edit record
  makebranch  Make a new branch
EOS
}

for OPT in "$@"; do
    case "$OPT" in
        'help'|'-h'|'--help')
            usage
            exit 1
            ;;
        '--version')
            echo $VERSION
            exit 1
            ;;
        'start') bash $CommandDir/start.sh ;;
        'commit') bash $CommandDir/commit.sh ;;
        'end') bash $CommandDir/end.sh ;;
        'push') bash $CommandDir/push.sh ;;
        'opne') bash $CommandDir/open.sh ;;
        'branch') bash $CommandDir/branch.sh ;;
        'checkout') bash $CommandDir/checkout.sh ;;
        'edit') bash $CommandDir/edit.sh ;;
        'makebranch') bash $CommandDir/makebranch.sh ;;
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
done

if [ -z $param ]; then
    usage
    exit 1
fi
