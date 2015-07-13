#!/bin/sh
# coding: utf-8
#
DEST=$(whoami)
[ -d $DEST ] || mkdir -p $DEST

## Current date in unix-timestamp format
CURRDATE=$(date +%s)
## Backup dir
BACKUPDIR="backup/${CURRDATE}"

##
if [ ! -d $BACKUPDIR ]; then
  mkdir -p $BACKUPDIR
fi

#
# Update a git subtree (prefix, user/repository)
update_subtree () {
  git subtree pull --prefix $1 "https://github.com/${2}" master --squash
}

## Atom preferences
update_subtree dot/.atom douggr/atom-config
cd .atom
. ./install.sh
cd ..

## Zuki themes
update_subtree dot/.themes lassekongo83/zuki-themes

#
# Copy the given path into your $HOME
copy () {
  FILE="${DEST}/${1}"

  if [ -f $FILE ] || [ -d $FILE ]; then
    cp -r $FILE "${BACKUPDIR}/${CONF}"
  fi

  cp -r $CONF $FILE
}

## Loop though files and copy them into your $HOME directory
for CONF in $(ls -A dot); do
  case $CONF in
    .git|backup|install.sh) continue
      ;;

    *) copy $CONF
      ;;
  esac
done
