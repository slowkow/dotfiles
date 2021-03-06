#!/usr/bin/env bash

# set -o xtrace

files=(
.bashrc
.bash_profile
.config/karabiner
.config/nvim
.gitconfig
.gitignore
.inputrc
.pandoc
.R
.Rprofile
.Renviron
.sqliterc
.tmux.conf
.unison
.vim
.vimrc
)

pwd=$(pwd)

for f in ${files[*]}
do
  if [[ $(readlink ~/$f) == $pwd/$f ]]
  then
    continue
  elif [[ -e ~/$f ]]
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
