#!/bin/bash

my_commit="$(date)"


echo $(pacman -Qnq) > ~/dotsfile/pkg_pacman
echo $(pacman -Qmq) > ~/dotsfile/pkg_aur

git add ~/dotsfile/.
git commit -m "$my_commit"
git push origin main
