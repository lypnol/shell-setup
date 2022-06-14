#!/bin/bash
CDIR=~/.shell-setup

rmlink(){
    rm -f $2
    ln -s $CDIR/$1 $2
}

# remote server
if [ -f ~/.shell-setup/.env ]; then
    # zsh
    rmlink zsh/env ~/.zshenv
    rmlink zsh/remote-rc ~/.zshrc
    # ssh
    rmlink ssh/remote-rc ~/.ssh/rc
# local laptop
else
    mkdir -p ~/bin
    rmlink zsh/local-rc ~/.zshrc
fi

# zsh themes
mkdir -p ~/.oh-my-zsh/custom/themes
rmlink zsh/custom-muse.zsh-theme ~/.oh-my-zsh/custom/themes/custom-muse.zsh-theme
rmlink zsh/custom-robbyrussell.zsh-theme ~/.oh-my-zsh/custom/themes/custom-robbyrussell.zsh-theme
