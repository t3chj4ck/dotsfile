#!/bin/bash

my_commit="$(date)"


pacman -Qnq | sort > ~/dotsfile/pkg_pacman
pacman -Qmq | sort > ~/dotsfile/pkg_aur

git add ~/dotsfile/.
git commit -m "$my_commit"
git push origin main
