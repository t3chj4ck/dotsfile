#!/bin/bash

#copy folder to ~/
dir="$(pwd)"
if [[ $dir != $HOME ]];then
    mkdir -p $HOME/dotsfile
    mv dots_home $HOME/dotsfile/
    mv dots_config $HOME/dotsfile/
fi


cd ~/dotsfile

stow dots_config
stow dots_home
yay -Syu $(cat ~/dotsfile/pkg_pacman)
yay -Syu $(cat ~/dotsfile/pkg_aur)
