#!/bin/bash
#------------------------------------------//
# last modified 01/03/2016					|
# running on Arch64							|
# https://github.com/azk4n/dotfiles			|
#------------------------------------------//

# Color syntax.
eval $(dircolors -b $HOME/.dircolors)

# stack commands
pushd /home/azk4n/git
pushd /home/azk4n/data
pushd /home/azk4n/code
pushd /home/azk4n/data/t00lb0x
cd
#------------------------------------------//


#aliases --------------------------//

alias data='cd /home/azk4n/data'
alias code='cd /home/azk4n/code'
alias toolbox='cd /home/azk4n/data/t00lb0x/'
alias di=' ls -lct /etc | tail -1 | awk '{print $7, $6, $8}' '
alias ls='ls -F -h --color=auto'
alias la='ls -Al --color=auto'
#alias ls='du -s */* | sort -n'
#alias music='mocp'
alias ports='netstat -nape --inet'
alias ns='netstat -alnp --protocol=inet'
#alias ls='ls --color=always'
#alias la='ls -Al'
#alias lx='ls -lXB'
#alias lk='ls -lSr'
#alias lc='ls -lcr'
#alias lu='ls -lur'
#alias lr='ls -lR'
#alias lt='ls -ltr'
#alias lm='ls -al |more'
#alias lr='ls -R' # using ls recursively - Handy with grep
#alias vol='elinks www.vivaolinux.com.br' # opens VOL in terminal
alias pdrm = 'mkfs.vfat /dev/sdb1'
#alias rm='rm -i'


#color aliases --------------------//
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'


# configure keyboard to pt_BR abnt2 layout
setxkbmap -model abnt2 -layout br -variant abnt2

#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////

extract(){
if [ -f "$1" ] ; then
case "$1" in
*.tar.bz2) tar xjf "$1" ;;
*.tar.gz) tar xzf "$1" ;;
*.tar.Z) tar xzf "$1" ;;
*.bz2) bunzip2 "$1" ;;
*.rar) unrar x "$1" ;;
*.gz) gunzip "$1" ;;
*.jar) unzip "$1" ;;
*.tar) tar xf "$1" ;;
*.tbz2) tar xjf "$1" ;;
*.tgz) tar xzf "$1" ;;
*.zip) unzip "$1" ;;
*.Z) uncompress "$1" ;;
*) echo "'$1' cannot be extracted." ;;
esac
else
echo "'$1' is not a file."
fi
}

myip (){
elinks -dump http://checkip.dyndns.org:8245/ | grep "Current IP Address" | cut -d":" -f2 | cut -d" " -f2
}

upinfo (){
echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}


cd()
{
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}

encrypt (){
gpg -ac --no-options "$1"
}

decrypt (){
gpg --no-options "$1"
}


#------------------------------------------////
# Some original .bashrc contents:
#------------------------------------------////
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


#------------------------------------------////
# ps1's
#------------------------------------------////

#PS1='\[\033[01;31m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\] > \[\033[00m\]'
#PS1="\e[\[00;37m┌─[\e[01;33m\u\e[00;37m]──[\e[1;33m${HOSTNAME%%.*}\e[0;37m]:\w$\e[0;37m\n\e[0;37m└──\e[0;37m >> \e[00m"
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '}
#PS1="┌─[\[\e[34m\]\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]]\n└─╼ "
#PS1='[\u@\h \W]\$ '
PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"

if [ -f ~/.bash_ps1 ]; then
. ~/.bash_ps1
fi
 

#------------------------------------------////
# sys info
#------------------------------------------////
clear
echo -e "${LIGHTGRAY}";figlet "archLinux64";
echo ""
echo -ne "${lightgray}Today is:\t\t${lightgray}" `date`; echo ""
echo -e "${lightgray}Kernel Information: \t${lightgray}" `uname -smr`
echo ""

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

export HISTTIMEFORMAT="%d/%m/%y %T " 
export HISTTIMEFORMAT="%d/%m/%y %T " 
