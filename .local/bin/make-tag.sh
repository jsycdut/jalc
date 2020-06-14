#!/usr/bin/env bash

# exit code
HELP=0
NO_CTAGS=85
NO_ARGS=86
PATH_NOT_EXIST=87
CWD=`pwd`

LANGUAGES='-all'

# process parameters
while [[ ! -z "$1" ]]; do
  case $1 in
    -d | --directory)
      shift
      DIR=$1
      ;;
    -h | --help)
      echo 'Usage: make-tag [-d --dir path-to-source-code] [language 1] [language 2...]'
      echo 'Default: generate tags for all kinds of languages in current directory'
      exit $HELP
      ;;
    *)
      LANGUAGES=$LANGUAGES',+'$1
      ;;
  esac
  shift
done

if [[ -n $DIR ]]; then
  cd $DIR
fi

# generate tags for specified languages
ctags --languages=$LANGUAGES -R

cd $CWD
