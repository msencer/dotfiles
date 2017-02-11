# oh-my-zsh BEGIN
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster-blacklight"
plugins=(git battery vi-mode)
source $ZSH/oh-my-zsh.sh
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
# oh-my-zsh END

if [ -f /Users/mkaradayi/.tnsrc ]; then
    source /Users/mkaradayi/.tnsrc
fi

if [ -f ~/.alias ];then
	. ~/.alias
fi

bindkey -v
set editing-mode vi
set keymap vi

export ZSH=/Users/mkaradayi/.oh-my-zsh
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/opt/android-sdk
export DEVMACH="MSK"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PAGER=less
export EDITOR=vim
export LANGUAGE=en

export NORMAL=`echo -n '\e[0m'`
export BLACK=`echo -n '\e[30m'`
export RED=`echo -n '\e[31m'`
export GREEN=`echo -n '\e[32m'`
export YELLOW=`echo -n '\e[33m'`
export BLUE=`echo -n '\e[34m'`
export MAGENTA=`echo -n '\e[35m'`
export CYAN=`echo -n '\e[36m'`
export WHITE=`echo -n '\e[36m'`
export BOLD=`echo -n '\e[01;37m'`
export BOLDRED=`echo -n '\e[01;31m'`
export ARCHBLUE=`echo -n '\e[34m'`
export DARKGREEN=`echo -n '\e[38;5;22m'`


PATH="/Users/mkaradayi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mkaradayi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mkaradayi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mkaradayi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mkaradayi/perl5"; export PERL_MM_OPT;

function mkdircd  {
	mkdir -p "$@" && eval cd "\"\$$#\""
}
function tssh {
    ssh "$@" -t tmux new-session -A -s main
}
function countlines() {
	count=0
	while read file; do
		let count=$count+`wc -l < $file`
	done
	echo $count
}
