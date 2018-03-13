#!/usr/bin/env bash

files=(
.bashrc
.bash_profile
.gitconfig
.gitignore
.inputrc
.pandoc
.sqliterc
.tmux.conf
)

pwd=$(pwd)

for f in ${files[*]}
do
  if [[ $(readlink ~/$f) = $pwd/$f ]]
  then
    continue
  fi
  if [[ -e ~/$f ]]
  then
    if [[ -d ~/${f}.bak ]]
    then
      read -p "~/${f}.bak exists. Overwrite it? " -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
	(set -x; rm -rf ~/${f}.bak; mv -i ~/$f ~/${f}.bak)
      fi
    else
	(set -x; mv -i ~/$f ~/${f}.bak)
    fi
  fi
  (set -x; ln -s $pwd/$f ~/$f)
done
