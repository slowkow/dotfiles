#!/usr/bin/env bash

# Download vim-plug
curl -fLo .vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Homebrew.
if ! command -v brew > /dev/null
then
  /usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Xcode Command Line Tools.
xcode-select --install

# Use the latest Homebrew.
brew update

# Upgrade any installed formulas.
brew upgrade

# Install brew auto-update
brew install terminal-notifier
brew tap domt4/autoupdate

brew autoupdate --start --upgrade --cleanup --enable-notifications

# Learn more about any package at: http://brewformulas.org/PACKAGE

# Search for a string across many files
brew install ripgrep
# brew install ack
# brew install the_platinum_searcher
# brew install the_silver_searcher

# Utilities like `sponge`.
brew install moreutils --without-parallel

# Utilities for compiling C code.
brew install cmake
brew install coreutils

# Install Bash 4.
brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells
then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash
fi

# New version of vim
# Note: this installs sqlite, perl, python3
brew install vim --with-override-system-vi
pip3 install --upgrade pip setuptools wheel

# Get the latest Python2
brew install python@2
pip install --upgrade pip setuptools

# Git version control
brew install git
brew install git-lfs

# Delete files from a git repo history
brew install bfg

# Convert line endings
brew install dos2unix

# Alernative to `find`
brew install fd

# View images quickly
brew install feh

# Convert video files
brew install ffmpeg

# User-friendly alternative to Bash
brew install fish
# Switch to using fish as default shell
if ! fgrep -q '/usr/local/bin/fish' /etc/shells
then
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
  # chsh -s /usr/local/bin/fish
fi

# Fuzzy search, useful for history
brew install fzy

# Make and optimize PDF files
brew install ghostscript

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Golang
brew install go

# Graphviz makes diagrams of graphs and networks
brew install graphviz

# Convert image file formats, crop, resize
brew install graphicsmagick

# New version of grep
brew install grep

# HDF5 is for storing large datasets for fast retrieval
brew install hdf5

# Download a complete website to a local folder
brew install httrack

# Static site generator in Go
brew install hugo

# Quickly jump to a different directory
brew install jump

# Query JSON files
brew install jq

# MP3 encoding
brew install lame

# Version control with hg
brew install mercurial

# like sed, awk, cut, join, and sort for name-indexed data such as CSV or JSON
brew install miller

# Alternative to ssh for poor quality internet connections
brew install mosh

# New version of vim
brew install neovim

# New version of ssh
brew install openssh

# Convert between document formats: .html .docx .md .pdf
brew install pandoc
brew install pandoc-citeproc

# GNU parallel executes jobs concurrently locally or using remote computers
brew install parallel

# Parallel gzip
brew install pigz

# Optimize PNG files
brew install pngquant

# Run SQL commands on CSV files: q "SELECT COUNT(*) FROM file.csv where c3 > 1"
brew install q

# Maybe needed for tmux?
# brew install reattach-to-user-namespace

# Quickly rename files with rules
brew install rename

# Compile SASS to CSS
brew install sassc

# SQLite is a lightweight alternative to MySQL
brew install sqlite

# Show easily understandable documentation
brew install tldr

# Terminal multiplexer, manage tabs, windows, panes
brew install tmux

# Show the folder structure of a directory
brew install tree

# Decompress .rar files
brew install unrar

# Keep re-running a command to watch the output
brew install watch

# Alternative to curl, download files from the web
brew install wget

# Compress files very efficiently, but slowly
brew install xz

# Node.js package manager
# Note: Installs node
brew install yarn

# Compiling R takes 5-10 minutes

# Java
brew cask install java

# OpenBLAS (installs gcc and other dependencies)
brew install openblas

# R language for statistical computing
brew install r --with-openblas --with-java

