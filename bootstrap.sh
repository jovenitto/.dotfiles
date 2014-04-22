#!/bin/bash

# Install (or update if exists) oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
	echo "Oh-my-zsh does not exist. Cloning repo..."
	cd ~
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
	echo "Oh-my-zsh exists. Pulling repo..."
 	cd ~/.oh-my-zsh
	git pull
	cd ~
fi
echo "Done."


# Install (or update if exists) zsh.syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo Zsh-syntax-highlighting plugin does not exist. Cloning repo...
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
        echo Zsh-syntax-highlighting plugin exists. Pulling repo...
	cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git pull
	cd ~
fi
echo "Done."


# simlink files

if [ ! -h ~/.zshrc ]; then
        echo .zshrc is not a link. Deleting and linking to repo...
	rm -rf ~/.zshrc
	ln -s ~/.dotfiles/zshrc ~/.zshrc
else
        echo .zshrc is a link. Nothing to do.
fi
echo "Done."

if [ ! -h ~/.vimrc ]; then
    echo .vimrc is not a link. Deleting and linking to repo...
    rm -rf ~/.vimrc
    ln -s ~/.dotfiles/vimrc ~/.vimrc
else
    echo .vimrc is a link. Nothing to do.
fi
echo "Done."


