#!/bin/bash

if [[ $SHELL != *"zsh" ]]
then
    echo "You need to have ZSH as your default shell !"
    exit
fi

cd ~

# Clean everything, in case we are re-running it
rm -rf .shell-setup .oh-my-zsh

# Clone ourselves
git clone https://github.com/lypnol/shell-setup.git ~/.shell-setup
cd ~/.shell-setup

if [[ -z "${ENV_NAME}" ]]; then
    echo "no env name, setting this as a laptop"
else
    echo "env $ENV_NAME, setting this as a remote server" 
    echo "$ENV_NAME" > .env
fi

./installs.sh
./links.sh

exec zsh
source ~/.zshrc
