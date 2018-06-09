# Do nothing if this is not an interactive shell.
[ -z "$PS1" ] && return

# Set API keys for various services.
[ -s ~/.api_keys ] && source ~/.api_keys

alias ..='cd ..'
alias ...='cd ../..'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias serve='python3 -m http.server'

alias zcat=gzcat

# nvim
alias vim=nvim

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cgrep='grep --color=always'

# ls
alias l='ls -CF'
alias ls='ls --color=auto'
alias ll='ls -AlFh'
alias la='ls -A'
alias lt='ls -Alht'

alias unison='/Applications/Unison.app/Contents/MacOS/cltool -ui text'

# Sandbox
export PATH="$HOME/work/github.com/slowkow/sandbox:$PATH"

# Brew
export PATH="/usr/local/sbin:$PATH"

# HDF5
export PATH="/usr/local/opt/hdf5@1.8/bin:$PATH"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/go/bin

# Perl
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# jump
eval "$(jump shell --bind=j)"

# Override default coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Override default sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# added by Miniconda3 installer
export PATH="${HOME}/miniconda3/bin:$PATH"

# ----------------------------------------------------------------------------
# Shell Prompt
# Taken from https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color'
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color'
fi

prompt_git() {
  local s=''
  local branchName=''

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?'
      fi

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi

    fi

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')"

    [ -n "${s}" ] && s=" [${s}]"

    echo -e "${1}${branchName}${2}${s}"
  else
    return
  fi
}

if tput setaf 1 &> /dev/null; then
  tput sgr0; # reset colors
  # bold=''
  bold=$(tput bold)
  reset=$(tput sgr0)
  # Solarized colors, taken from http://git.io/solarized-colors.
  black=$(tput setaf 0)
  blue=$(tput setaf 33)
  cyan=$(tput setaf 37)
  green=$(tput setaf 64)
  orange=$(tput setaf 166)
  purple=$(tput setaf 125)
  red=$(tput setaf 124)
  violet=$(tput setaf 61)
  white=$(tput setaf 15)
  yellow=$(tput setaf 136)
else
  bold=''
  reset="\e[0m"
  black="\e[1;30m"
  blue="\e[1;34m"
  cyan="\e[1;36m"
  green="\e[1;32m"
  orange="\e[1;33m"
  purple="\e[1;35m"
  red="\e[1;31m"
  violet="\e[1;35m"
  white="\e[1;37m"
  yellow="\e[1;33m"
fi

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${red}"
else
  userStyle="${orange}"
fi

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}"
else
  hostStyle="${yellow}"
fi

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\] "
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\] "
PS1+="\[${green}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] \[${yellow}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n"
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1

PS2="\[${yellow}\]→ \[${reset}\]"
export PS2
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Use tmux to manage windows and tabs

# On Broad servers:
# use .tmux-2.1
broad_hosts=(gold platinum silver lorax piglet tigger)

# We're not in a tmux session.
if [[ "$TMUX" == "" ]]
then
    host=$(hostname | cut -d. -f1)

    # # This must be run OUTSIDE of a tmux session.
    # # It fixes some weirdness about copy-paste with xsel and others.
    # # Set the display for all sessions.
    # for name in $(tmux ls -F $host 2>/dev/null); do
    #     tmux setenv -g -t $name DISPLAY $DISPLAY 
    # done

    # Create tmux sessions on these hosts.
    # if [[ " ${broad_hosts[@]} " =~ " $host " ]]
    # if test true
    if [[ "wm6ad-770" != "$host" ]]
    then
      echo "get tmux going"
        # Check for an existing session, or else create it.
        if [[ "$(tmux ls 2>/dev/null | grep -o $host)" == "" ]]
        then
            tmux new-session -s "$host"
        else
            tmux attach-session -t "$host"
        fi
    fi
fi
# ----------------------------------------------------------------------------

