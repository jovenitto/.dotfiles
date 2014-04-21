#!/bin/bash



# Install (or update if exists) oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
	cd ~
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
	cd ~/.oh-my-zsh
	git pull
	cd ~
fi

# Install (or update if exists) zsh.syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
	cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git pull
	cd ~
fi

