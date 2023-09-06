#!/usr/bin/env zsh

# Set XDG Base Directory paths
export XDG_CONFIG_HOME="${HOME}/.config"          # User configuration files
export XDG_CACHE_HOME="${HOME}/.cache"            # User cache files
export XDG_DATA_HOME="${HOME}/.local/share"       # User data files
export XDG_STATE_HOME="${HOME}/.local/state"      # User state files

# Set other tool and configuration paths to clean up ~
export CARGO_HOME="$XDG_DATA_HOME"/cargo          # Rust's Cargo package manager
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv       # NVIDIA CUDA cache
export GNUPGHOME="$XDG_DATA_HOME"/gnupg           # GNU Privacy Guard home
export ANDROID_HOME="$XDG_DATA_HOME"/android     # Android SDK home
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}"/java # Java preferences

export ZDOTDIR="${HOME}/.config/zsh"

# Set zsh shell history file path and set max history length
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0 # Disable dates in zsh-fzf-history
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0 # Disable index in zsh-fzf-history
export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1 # Hide duplicates in zsh-fzf-history

# Add additional directories to PATH
export PATH=$PATH:~/.local/scripts:~/.local/bin:~/.local/share/cargo/bin

# Set sudo password prompt
export SUDO_PROMPT='[] Enter Password: '

# Set default editor
export EDITOR='nvim'

# execute Hyprland when in TTY1 only
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

#
# Auto start ssh-agent and store settings
#

export SSH_ENV="$HOME/.ssh/env"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
