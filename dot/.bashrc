#!/bin/bash
# A basically sane bash environment.
#

# bring in system bashrc
[ -f "/etc/bash.bashrc" ] && source /etc/bash.bashrc

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# notify of bg job completion immediately
set -o notify

# shell opts. see bash(1) for details
#shopt -s cdspell                 >/dev/null 2>&1
#shopt -s extglob                 >/dev/null 2>&1
#shopt -s histappend              >/dev/null 2>&1
#shopt -s hostcomplete            >/dev/null 2>&1
#shopt -s interactive_comments    >/dev/null 2>&1
#shopt -u mailwarn                >/dev/null 2>&1
#shopt -s no_empty_cmd_completion >/dev/null 2>&1

# fuck that you have new mail shit
unset MAILCHECK

# fuck that incredibly annoying PC speaker 'bell' sound
if command -v xset >/dev/null; then
  xset b off
fi

# disable core dumps
ulimit -S -c 0

# default umask
umask 0022

# I want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin"

# put ~/.local/bin on PATH
PATH="$HOME/.local/bin:$PATH"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# always use PASSIVE mode ftp
export FTP_PASSIVE=1

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Speed up firefox disabling pango
export MOZ_DISABLE_PANGO=1

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# override and disable tilde expansion
_expand() {
  return 0
}

# Load shell files found in ~/.bashrc.d
for file in $HOME/.bashrc.d/*; do
  source $file
done
unset file
