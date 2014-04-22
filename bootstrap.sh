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
echo "Done pulling."


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
echo "Done pulling."


# simlink files

for file in zshrc vimrc
do
    if [ ! -h ~/.$file ]; then
        echo .$file is not a link. Deleting and linking to repo.
	    echo rm -rf ~/.$file
	    echo ln -s ~/.dotfiles/$file ~/.$file
    else
        echo .$file is a link. Nothing to do.
    fi
done

