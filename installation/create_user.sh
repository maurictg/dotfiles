#!/bin/sh
printf "Enter a username: "
read username

useradd --create-home -s /bin/bash $username
passwd $username

usermod -aG audio $username
usermod -aG video $username
usermod -aG wheel $username
usermod -aG uucp $username # serial ports

echo "exec awesome" > /home/$username/.xinitrc

cat <<\EOF > /home/$username/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

alias sudo="doas"
alias la="ls -a"

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
EOF

mkdir /home/$username/Programs
mkdir /home/$username/Scripts