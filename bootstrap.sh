#!/bin/bash

echo Setting up the environment...

# Install (or update if exists) oh-my-zsh
echo
echo Checking Oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
	echo "Oh-my-zsh does not exist. Cloning."
	cd ~
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &> /dev/null
else
	echo "Oh-my-zsh exists. Pulling."
 	cd ~/.oh-my-zsh
	git pull &> /dev/null
	cd ~
fi

# Install (or update if exists) zsh.syntax-highlighting
echo
echo Checking Zsh-syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo Zsh-syntax-highlighting plugin does not exist. Cloning.
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &> /dev/null
else
    echo Zsh-syntax-highlighting plugin exists. Pulling.
	cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git pull &> /dev/null
	cd ~
fi


# simlink files
echo
echo Checking simlink files...
for file in zshrc vimrc
do
    if [ ! -h ~/.$file ]; then
        echo .$file is not a link. Deleting and linking to repo.
	    rm -rf ~/.$file  &> /dev/null
	    ln -s ~/.dotfiles/$file ~/.$file &> /dev/null
    fi
done

echo
echo Done.

