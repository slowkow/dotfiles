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

# Utilities for compiling C code.
brew install cmake
brew install coreutils

# Utilities like `sponge`.
#brew install moreutils --without-parallel

# Install latest Bash
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
brew install vim #--with-override-system-vi
pip3 install --upgrade pip setuptools wheel

# Search for a string across many files
# brew install ripgrep # (use cargo to install ripgrep)
# brew install ack
# brew install the_platinum_searcher
# brew install the_silver_searcher

# Get the latest Python2
#brew install python@2
#pip install --upgrade pip setuptools

# Git version control
brew install git
brew install git-lfs
# brew install git-annex

# Delete files from a git repo history
brew install bfg

# # Ruby Version Manager
# gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable
# rvm install ruby-head
# gem install bundler


#####################################################################
# Other Stuff

# Needed to compile older versions of Karabiner Elements
# brew install boost

# Alternative to `diff`
brew install diff-so-fancy

# Convert line endings
brew install dos2unix

# View images quickly
brew install feh

# Convert video files
brew install ffmpeg

# Lots of weird icons and glyphs
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Fuzzy search, useful for history
brew install fzy

# Make and optimize PDF files
brew install ghostscript

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Golang
brew install go

# Extract elements from HTML
go get -v -u github.com/ericchiang/pup

# Run jobs in parallel (alternative to GNU parallel)
go get -v -u github.com/shenwei356/rush

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
# brew install lame

# Mac App Store Command Line Interface
# brew install mas

# Amazon app for reading ebooks
# mas 'Kindle', id: 405399194

# Visualize disk space usage
# mas 'GrandPerspective', id: 1111570163

# Resize windows neatly
# mas 'Magnet', id: 441258766

# Version control with hg
# brew install mercurial

# like sed, awk, cut, join, and sort for name-indexed data such as CSV or JSON
# brew install miller

# Alternative to ssh for poor quality internet connections
brew install mosh

# Compress JPEG files
# brew install mozjpeg

# Alternative to unison for synchronizing filesystems
brew install havoc-io/mutagen/mutagen

# Alternative to `du`
brew install ncdu

# New version of vim
brew install neovim

# nim programming language
# brew install nim

# New version of ssh
brew install openssh

# Convert between document formats: .html .docx .md .pdf
brew install pandoc
brew install pandoc-citeproc

# Convert PDF to HTML
# brew install pdf2htmlEX

# GNU parallel executes jobs concurrently locally or using remote computers
# brew install parallel

# Parallel gzip
# brew install pigz

# Optimize PNG files
brew install pngquant

# Compute dissimilarity between two or more PNG files
# brew install dssim

# Run SQL commands on CSV files: q "SELECT COUNT(*) FROM file.csv where c3 > 1"
# brew install q

# Maybe needed for tmux?
# brew install reattach-to-user-namespace

# Quickly rename files with rules
# brew install rename

# Compile SASS to CSS
# brew install sassc

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

# List of TSV tools: https://github.com/eBay/tsv-utils/blob/master/docs/OtherToolkits.md

# Compress files very efficiently, but slowly
brew install xz


#####################################################################
# The R-Project for Statistical Computing

# Compiling R takes 5-10 minutes

# Java
brew cask install java

# OpenBLAS (installs gcc and other dependencies)
brew install openblas

# R language for statistical computing
# brew install r --with-openblas --with-java --with-cairo

# The R version from brew cannot be compiled with cairo.
# So, it may be better to get it from CRAN: https://cloud.r-project.org/bin/macosx/R-3.5.1.pkg

# LaTeX tools like pdflatex
brew cask install basictex

# Install texlive packages needed to build R package vignettes
sudo tlmgr update --self
sudo tlmgr update --all
sudo tlmgr install titling framed inconsolata
sudo tlmgr install collection-fontsrecommended

# Needed for checks on size reduction of PDFs when developing R packages
brew install qpdf

# Install XQuartz, needed for R package "Cairo"
brew cask install xquartz

# Needed for R package "RMySQL"
brew install mariadb-connector-c

# Needed for R packages: udunits2, units, ggforce
brew install udunits


#####################################################################
# Node.js programs

# Node.js package manager (Note: Installs node)
brew install yarn

# Optimize SVG files
npm install -g svgo


#####################################################################
# Rust

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Alternative to sed
cargo install sd

# Alternative to `grep` (`rg`)
cargo install ripgrep

# A fast CSV command line toolkit written in Rust.
cargo install xsv

# Alternative to `cat`
# brew install bat
cargo install bat

# Alternative to `ls`
# brew install exa
cargo install exa

# Alernative to `find`
# brew install fd
cargo install fd-find
