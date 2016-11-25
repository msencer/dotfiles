#!/usr/bin/env bash

vundle=~/.vim/bundle/Vundle.vim
platform=$(uname)


echo "Checking Vundle ..."
if [ ! -d $vundle ]; then
       echo "Vundle not found! Installing Vundle ..."
       git clone https://github.com/VundleVim/Vundle.vim.git $vundle
else
       echo "Vundle found!"
fi

echo "Checking ZSH ..."
if [ ! -n $ZSH_VERSION ]; then
	echo "ZSH not found. Installing ZSH ..."
	case $platform in
		"Darwin")
			echo "OSX found!"
			# TODO : check if brew executable exists
			brew install zsh zsh-completions
			;;
		"Linux")
			echo "Linux found!"
			sudo apt-get install zsh
			;;
		*)
			echo "Something went wrong! Exitting ..."
			exit 1
	esac
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
	echo "ZSH found!"
fi

echo "Checking honukai theme ..."
if [ ! -f ~/.oh-my-zsh/themes/honukai.zsh-theme ]; then
	echo "Nope, installing honukai theme"
	wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"
    else
	echo "You already have honukai theme, awesome!"
fi

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Symlinking vimrc ..."
if [ -f ~/.vimrc ];then rm ~/.vimrc;fi
ln -s $current_dir/vimrc ~/.vimrc

echo "Symlinking gitconfig"
if [ -f ~/.gitconfig ];then rm ~/.gitconfig;fi
ln -s $current_dir/gitconfig ~/.gitconfig

echo "Symlinking tmux.conf"
if [ -f ~/.tmux.conf ];then rm ~/.tmux.conf;fi
ln -s $current_dir/tmux.conf ~/.tmux.conf

echo "Installing VIM plugins ..."
vim +PluginInstall +qall

echo "That's it !"
