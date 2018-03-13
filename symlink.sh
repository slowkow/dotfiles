#!/usr/bin/env bash

files=(
.bashrc
.bash_profile
.gitconfig
.gitignore
.inputrc
)

for f in ${files[*]}
do
  if [[ -f ~/${f}.bak ]]
  then
    echo "Trying to 'mv ~/$f ~/${f}.bak' but ~/${f}.bak already exists! Please delete it before proceeding."
    exit 1
  fi
  mv ~/$f ~/${f}.bak
  ln -s $(pwd)/$f ~/$f
done
