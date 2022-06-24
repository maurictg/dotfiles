#!/bin/sh
setup_user_env () {
    source ./create_user.sh

    ask "Do you want to setup the DE/window manager (Sway)"
    if [ $RES = true ]
    then
        source ./desktop.sh
    fi

    ask "Do you want to setup some programs (firefox etc?)"
    if [ $RES = true ]
    then
        source ./programs.sh
    fi

    ask "Do you want to setup dev environment"
    if [ $RES = true ]
    then
        source ./dev.sh
    fi
}

ask ()
{
    RES=true
    printf "$1? (Y/n) "
    read repl

    if [[ $repl =~ ^[Nn]$ ]]
    then
        RES=false
    fi
}

echo "=== Welcome @ maurict-Artix installer script! ==="

ask "Do you want to setup doas and pacman (required?)"
if [ $RES = true ]
then
    source ./doas.sh
    source ./pacman.sh
else
    exit 0
fi

ask "Do you want to create a new user and setup user environment"
if [ $RES = true ]
then
    setup_user_env
fi

ask "Do you want to setup OpenRC"
if [ $RES = true ]
then
    source ./iwd.sh

    ask "Do you want to install eduroam for IWD?"
    if [ $RES = true ]
    then
        source ./eduroam_avans.sh
    fi
fi

ask "Do you want to run optimalizations"
if [ $RES = true ]
then
    source ./optimize.sh
fi

ask "Do you want to reboot"
if [ $RES = true ]
then
    reboot
fi

echo "Bye!"