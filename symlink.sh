#!/usr/bin/env bash

set -o xtrace

files=(
.bashrc
.bash_profile
.gitconfig
.gitignore
.inputrc
.pandoc
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
        rm -rf ~/${f}.bak
        mv -i ~/$f ~/${f}.bak
      fi
    else
        mv -i ~/$f ~/${f}.bak
    fi
  fi
  ln -s $pwd/$f ~/$f
done
