#!/bin/bash
echo Checking repos...
# Install (or update if exists) oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
	echo \ --\> Cloning oh-my-zsh
	cd ~
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &> /dev/null
else
	echo \ --\> Pulling oh-my-zsh
 	cd ~/.oh-my-zsh
	git pull &> /dev/null &
	cd ~
fi

# Install (or update if exists) zsh.syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
	echo \ --\> Cloning zsh-syntax-highlighting plugin
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting &> /dev/null
else
    echo \ --\> Pulling zsh-syntax-highlighting plugin
    cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git pull &> /dev/null &
	cd ~
fi


# simlink files
echo Checking simlink files...
for file in zshrc vimrc
do
    if [ ! -h ~/.$file ]; then
        echo \ --\> .$file is not a link. Deleting and linking to repo
	    rm -rf ~/.$file  &> /dev/null
	    ln -s ~/.dotfiles/$file ~/.$file &> /dev/null
    fi
done

echo Checking environment addons...

if [ ! -e ~/.cache/zsh/dirs ]; then
    echo \ --\> Configuring DirStack
    cd ~
    mkdir -p ~/.cache/zsh
    touch ~/.cache/zsh/dirs
fi

echo Done.

