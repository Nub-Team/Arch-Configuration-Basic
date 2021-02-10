#!/bin/bash
DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
sudo pacman -Syu $DEPLIST
