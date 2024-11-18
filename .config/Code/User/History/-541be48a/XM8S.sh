#!/bin/bash -e

sudo pacman -Syu --noconfirm
sudo pacman -S - < packages.txt

