# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autocompletion for aliases
setopt completealiases

# Ignore duplicates in history
setopt HIST_IGNORE_DUPS

# Reset termianl automatically after command completeion
ttyctl -f

# Make colored prompt
autoload -U promptinit
promptinit
prompt walters

# Add git status
source ~/.zsh-git-prompt/zshrc.sh

# 256 colors
export TERM=xterm-256color
export TERMINAL=xfce4-terminal # Terminal emulator

# Set prompt
PROMPT='[%F{white}%n%f]$(git_super_status): '
RPROMPT='%F{green}%~%f'

# Aliases
alias ls='ls --color -h --group-directories-first'
alias l='ls -1shB'
alias vimrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias i3rc='vim ~/.config/i3/config'
alias gss='git status -s'
alias gs='git status'

# Variables
#PATH=$PATH:/home/user/.gem/ruby/2.2.0/bin
EDITOR=vim

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.myscripts"
eval "$(rbenv init -)"

# Source nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Keyboard layout switcher key
#setxkbmap "us,ru" ",winkeys" "grp:rctrl_toggle"


