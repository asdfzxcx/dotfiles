# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

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
#export TERM=xterm-256color
#export TERMINAL=xfce4-terminal # Terminal emulator

# Set prompt
PROMPT='$(git_super_status) >>%f '
#RPROMPT='%F{green}%~%f'
RPROMPT=''

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
esac

# Aliases
alias ls='ls --color -h --group-directories-first'
alias l='ls -1shB'
alias la='l -A'
alias ll='l -l'
alias vimrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias zrce='vim ~/.extra_aliases.sh'
alias zr='. ~/.zshrc'
alias i3rc='vim ~/.config/i3/config'
alias gss='git status -s'
alias gs='git status'
alias sup='sudo docker-compose up'
alias sop='sudo docker-compose stop'
alias sun='sudo docker-compose run'
alias sus='sudo docker-compose ps'
alias gb='git branch'
alias gbr='git branch -r'
alias gl='git log --pretty=oneline -n 10'
alias gc='git checkout'
alias push='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull'
alias ix='NODEBUG= iex -S mix'
alias mc='NODEBUG= mix compile'
alias mt='NODEBUG= mix test'
alias mfs='NODEBUG= iex -S mix phoenix.server'
alias watchsync='watch grep -e Dirty: -e Writeback: /proc/meminfo'

# Functions
gof() {
  git checkout feature/$1
}

gofb() {
  git checkout -b feature/$1
}

udp(){
  bash -c "echo $3 > /dev/udp/$1/$2"
}

if [[ -a ~/.extra_aliases.sh ]]; then
  source ~/.extra_aliases.sh
fi

# Variables
export EDITOR=vim
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.myscripts"
export PATH="$PATH:$HOME/.mix/escripts"

# rbenv
eval "$(rbenv init -)"

# Source nvm
init_nvm(){
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

# Keyboard layout switcher key
#setxkbmap "us,ru" ",winkeys" "grp:rctrl_toggle"

#AUTOENV_FILE_ENTER='.env.common'
source ~/.dotfiles/.zsh-extra/zsh-autoenv/autoenv.zsh
AUTOENV_HANDLE_LEAVE=1
