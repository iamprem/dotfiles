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

alias tvon="xrandr --output HDMI-0 --scale 0.666x0.666 --auto --same-as DP-0"
alias tvoff="xrandr --output HDMI-0 --off; xrandr --output DP-0 --auto"
alias pcsound="pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:hdmi-stereo"
alias tvsound="pacmd set-card-profile alsa_card.pci-0000_01_00.1 output:hdmi-stereo-extra1"

alias tv-with-sound="tvon && tvsound"
alias tv-no-sound="tvon && pcsound"
