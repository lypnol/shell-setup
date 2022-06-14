# ZSH install
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing OMZ"
    curl -L http://install.ohmyz.sh | zsh
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
	cd ~
	touch .z
	if [ ! -f ~/.shell-setup/.env ]; then
		mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
	fi
else
    echo "OMZ already installed"
fi

touch ~/.z
