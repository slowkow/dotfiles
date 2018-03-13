# Kamil Slowikowski's Dotfiles

This repo documents how I like to set up my Macbook.

Install [Karabiner] and remap <kbd>caps lock</kbd> to <kbd>esc</kbd>.

Install [Homebrew] and `brew install git`.

Then copy this repo:

```bash
mkdir -p ~/work/github.com/slowkow
cd ~/work/github.com/slowkow
git clone git@github.com:slowkow/dotfiles.git
cd dotfiles
```

After installing Homebrew, run `bash brew.sh` to install lots of packages.

These languages will be installed automatically:

- Perl
- Python3 and Python2
- Ruby
- Node
- Java
- R
- Go

Then run `bash symlink.sh` to make symbolic links to your home folder.

Open `vim` and wait 30 seconds for the plugins to be installed.

Some of the settings were influenced by or copied directly from:

- Mathias Bynens: https://github.com/mathiasbynens/dotfiles
- Kenneth Reitz: https://github.com/kennethreitz/dotfiles

[Homebrew]: https://brew.sh/
[Karabiner]: https://github.com/tekezo/Karabiner-Elements

