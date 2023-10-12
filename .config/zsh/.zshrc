#!/usr/bin/env zsh

export ZDOTDIR="${HOME}/.config/zsh"

# Source ZSH configs
source ${ZDOTDIR}/options.zsh # Source zsh options
source ${ZDOTDIR}/compinit.zsh # Source completion conf
source ${ZDOTDIR}/aliases.zsh # Source zsh aliases
source ${ZDOTDIR}/keybinds.zsh # Source zsh keybinds
source ${ZDOTDIR}/functions.zsh # Source custom functions
source ${ZDOTDIR}/zgenom.zsh # Source zgenom for plugins

PROMPT='%F{purple}%3~%f $ '

neofetch
