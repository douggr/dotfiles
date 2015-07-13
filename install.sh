#!/bin/sh
# coding: utf-8
#

## Destination path
DEST=$1 || $HOME

## Create destination directory, if needed
mkdir -p $DEST

## Current date in unix-timestamp format
CURRDATE=$(date +%s)

## Backup dir
BACKUPDIR="backup/${CURRDATE}"

## Create child directories
mkdir -p $BACKUPDIR
mkdir -p $DEST/.local/bin
mkdir -p $DEST/.ssh

#
# GitHub web root
github_url () {
  echo https://github.com/$1
}

#
# Update a git subtree (prefix, user/repository)
update_subtree () {
  git subtree pull --prefix $1 $(github_url $2) master --squash
}

## Atom preferences
update_subtree dot/.atom douggr/atom-config
cd dot/.atom
. ./install.sh
cd ../..

## Zuki themes
update_subtree dot/.themes lassekongo83/zuki-themes

#
# Copy the given path into your $HOME
copy () {
  FILE="${DEST}/${1}"

  if [ -f $FILE ] || [ -d $FILE ]; then
    cp -r $FILE "${BACKUPDIR}/${CONF}"
  fi

  cp -r dot/$CONF $FILE
}

## Loop though files and copy them into your $HOME directory
for CONF in $(ls -A dot); do
  copy $CONF
done

echo "Would you like to install docker-compose? [y/n]"
read CONFIRM

if [ "y" = "$CONFIRM" ]; then
  ## Install docker-compose (https://github.com/docker/compose)
  ARCH="$(uname -s)-$(uname -m)"
  curl \
    -L "$(github_url docker/compose)/releases/download/1.3.1/docker-compose-${ARCH})" \
    > $DEST/.local/bin/docker-compose

  chmod +x $DEST/.local/bin/docker-compose
fi
