# Kamil's dotfiles

This repo documents how I like to set up my computers.

Set macOS settings with `bash macos-settings.sh`.

First, install [Homebrew] and `brew install git`:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
```

Then clone this repo:

```bash
mkdir -p ~/work/github.com/slowkow
cd ~/work/github.com/slowkow
git clone git@github.com:slowkow/dotfiles.git
cd dotfiles
```

Next, run `bash install.sh` to install lots of packages.

Then run `bash symlink.sh` to make symbolic links from the dotfiles to your
home folder.

Open `vim` and wait 30 seconds for the plugins to be installed.

Some of the settings were influenced by or copied directly from:

- Mathias Bynens: https://github.com/mathiasbynens/dotfiles
- Kenneth Reitz: https://github.com/kennethreitz/dotfiles

## Other nice software for macOS

[Karabiner] remaps buttons like <kbd>caps lock</kbd> to <kbd>esc</kbd> and
<kbd>mouse4</kbd> to <kbd>⌘ </kbd>+<kbd>[</kbd>.

[Contexts] provides a nice <kbd>⌘ </kbd>+<kbd>tab</kbd> menu to switch apps.

[Alfred] replaces Spotlight to instantly search for PDF files, folders, and
it keeps a nice clipboard history.

[Dash] provides instant and convenient access to lots of documentation.

[RadioSilence] stops apps from phoning home and sending your information to
servers.

[Alfred]: https://alfredapp.com
[Contexts]: https://contexts.co
[Dash]: https://kapeli.com/dash
[Flycut]: https://github.com/TermiT/Flycut
[Homebrew]: https://brew.sh
[Karabiner]: https://github.com/tekezo/Karabiner-Elements
[RadioSilence]: https://radiosilenceapp.com

