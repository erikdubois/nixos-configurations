#!/usr/bin/env bash
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

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################


echo
tput setaf 2
echo "################################################################"
echo "################### Copy over config"
echo "################################################################"
tput sgr0
echo

host=$(hostname)

if $host == "nixos-riker"; then
	cd riker
	bash ./copy.sh
	cd ..
fi

if $host == "nixos-data"; then
	cd data
	bash ./copy.sh
	cd ..
fi


if $host == "nixos-worf"; then
	cd worf
	bash ./copy.sh
	cd ..
fi


if $host == "nixos-picard"; then
	cd picard
	bash ./copy.sh
	cd ..
fi

cd dotfiles
bash ./copy.sh

echo
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

