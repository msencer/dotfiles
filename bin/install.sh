#!/usr/bin/env bash
#!/usr/bin/env bash

# link all files from the dotfiles repo in $HOME, iff non existant, or
# non-changed
# allow being chatty on what we do
VERBOSE=
[[ " $* " == *" -v "* ]] && VERBOSE=yes
vecho() {
    [[ -n ${VERBOSE} ]] && echo "$@"
}
# and to be really lethal
FORCE=
[[ " $* " == *" -f "* ]] && { FORCE=yes; vecho "force: moving all files away"; }


vundle=~/.vim/bundle/Vundle.vim
ohmyzsh=~/.oh-my-zsh
platform=$(uname)

vecho "Checking Vundle ..."
if [ ! -d $vundle ]; then
       vecho "Vundle not found! Installing Vundle ..."
       git clone https://github.com/VundleVim/Vundle.vim.git $vundle
else
       vecho "Vundle found!"
fi

vecho "Checking ZSH ..."
if [ ! -n $ZSH_VERSION ]; then
	vecho "ZSH not found. Installing ZSH ..."
	case $platform in
		"Darwin")
			vecho "OSX found!"
			# TODO : check if brew executable exists
			brew install zsh zsh-completions
			;;
		"Linux")
			vecho "Linux found!"
			sudo apt-get install zsh
			;;
		*)
			vecho "Something went wrong! Exitting ..."
			exit 1
	esac
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
	vecho "ZSH found!"
fi

vecho "Checking honukai theme ..."
if [ ! -f $ohmyzsh/themes/honukai.zsh-theme ]; then
	vecho "Nope, installing honukai theme"
	wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"
    else
	vecho "You already have honukai theme, awesome!"
fi

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
current_dir="$(dirname "$current_dir")"/dotfiles


find "${current_dir}" \
	\( -name .git -a -type d -prune \) -o \
	\( -name .svn -a -type d -prune \) -o \
	\( -name .hg -a -type d -prune \) -o \
	\( -name .bzr -a -type d -prune \) -o \
	-type f -print -o -type l -print | \
while read f ; do
	src=${f}
	dst=${HOME}${f#${current_dir}}
	ln -sf "${src}" "${dst}"
	vecho "symlinked ${src} to ${dst}"
done


vecho "Installing VIM plugins ..."
vim +PluginInstall +qall

vecho "That's it !"
