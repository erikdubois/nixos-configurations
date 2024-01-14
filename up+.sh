#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

# echo "Surfn-Plasma-Dark"
# git clone https://github.com/erikdubois/Surfn-Plasma-Dark --depth=1  /tmp/input
# cp -r /tmp/input/usr/share/* dotfiles/.local/share/
# rm -rf /tmp/input

# echo "Surfn-Plasma-Light"
# git clone https://github.com/erikdubois/Surfn-Plasma-Light --depth=1  /tmp/input
# cp -r /tmp/input/usr/share/* dotfiles/.local/share/
# rm -rf /tmp/input

# echo "Surfn-Plasma-Flow"
# git clone https://github.com/erikdubois/Surfn-Plasma-Flow --depth=1  /tmp/input
# cp -r /tmp/input/icons/* dotfiles/.local/share/icons/
# rm -rf /tmp/input

# echo "Surfn-Plasma-Dark-Tela"
# git clone https://github.com/erikdubois/Surfn-Plasma-Dark-Tela --depth=1  /tmp/input
# cp -r /tmp/input/usr/share/* dotfiles/.local/share/
# rm -rf /tmp/input

# echo"Btop"
# git clone https://github.com/arcolinux/arcolinux-btop --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config
# rm -rf /tmp/input

# echo"Thunar"
# git clone https://github.com/arcolinux/arcolinux-xfce --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/Thunar/* dotfiles/.config/Thunar
# rm -rf /tmp/input

# echo"Variety"
# git clone https://github.com/arcolinux/arcolinux-variety --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo"Variety"
# git clone https://github.com/arcolinux/arcolinux-variety-autostart --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo"btop"
# git clone https://github.com/arcolinux/arcolinux-btop --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo "alacritty"
# git clone https://github.com/arcolinux/arcolinux-alacritty --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo "bin"
# git clone https://github.com/arcolinux/arcolinux-bin --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.* dotfiles/
# rm -rf /tmp/input

# echo "Awesome"
# git clone https://github.com/arcolinux/arcolinux-awesome --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo "I3wm"
# git clone https://github.com/arcolinux/arcolinux-i3wm --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# echo "Chadwm"
# git clone https://github.com/arcolinux/arcolinux-chadwm --depth=1  /tmp/input
# cp -r /tmp/input/etc/skel/.config/* dotfiles/.config/
# rm -rf /tmp/input

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
