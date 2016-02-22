#!/bin/bash

dir = $(pwd)

ln -s $dir/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
mkdir -p ~/.config/i3/
ln -s $dir/.config/i3/config ~/.config/i3/config
ln -s $dir/.fonts ~/.fonts
ln -s $dir/.myscripts ~/.myscripts
ln -s $dir/.vim ~/.vim
ln -s $dir/.zsh-git-prompt ~/.zsh-git-prompt
ln -s $dir/.bash_profile ~/.bash_profile
ln -s $dir/.vimrc ~/.vimrc
ln -s $dir/.zshrc ~/.zshrc
ln -s $dir/.rbenv ~/.rbenv
