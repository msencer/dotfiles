# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mkaradayi/.oh-my-zsh

export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME=/usr/local/opt/android-sdk

ZSH_THEME="robbyrussell"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export DEVMACH="MSK"

export SSH_KEY_PATH="~/.ssh/rsa_id"

###-tns-completion-start-###
if [ -f /Users/mkaradayi/.tnsrc ]; then
    source /Users/mkaradayi/.tnsrc
fi
###-tns-completion-end-###

if [ -f ~/.alias ];then
	. ~/.alias
fi

PATH="/Users/mkaradayi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mkaradayi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mkaradayi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mkaradayi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mkaradayi/perl5"; export PERL_MM_OPT;
