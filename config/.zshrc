export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/prem/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'
export BROWSER=/usr/bin/google-chrome-stable

# Aliases
alias gstr="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && get status -s && echo)' \;"

