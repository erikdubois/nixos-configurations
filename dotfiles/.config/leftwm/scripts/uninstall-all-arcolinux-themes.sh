#!/bin/bash
#set -e
###############################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxforum.com
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
###############################################################################

echo
echo "###############################################################################"
echo "Installing themes"
echo "###############################################################################"
echo

leftwm-theme apply candy

leftwm-theme uninstall arise --noconfirm
leftwm-theme uninstall db --noconfirm
leftwm-theme uninstall db-color-dev --noconfirm
leftwm-theme uninstall db-comic --noconfirm
leftwm-theme uninstall db-nemesis --noconfirm
leftwm-theme uninstall db-scifi --noconfirm
leftwm-theme uninstall db-scifi-star --noconfirm
leftwm-theme uninstall docky --noconfirm
leftwm-theme uninstall doublebar --noconfirm
leftwm-theme uninstall eden --noconfirm
leftwm-theme uninstall fancy --noconfirm
leftwm-theme uninstall forest --noconfirm
leftwm-theme uninstall grayblocks --noconfirm
leftwm-theme uninstall greyblocks --noconfirm
leftwm-theme uninstall halo --noconfirm
leftwm-theme uninstall material --noconfirm
leftwm-theme uninstall matrix --noconfirm
leftwm-theme uninstall mesh --noconfirm
leftwm-theme uninstall parker --noconfirm
leftwm-theme uninstall pi --noconfirm
leftwm-theme uninstall shades --noconfirm
leftwm-theme uninstall sb-horror --noconfirm
leftwm-theme uninstall smooth --noconfirm
leftwm-theme uninstall space --noconfirm
leftwm-theme uninstall starwars --noconfirm

leftwm-theme update

echo "###############################################################################"
echo "###                                DONE                                    ####"
echo "###############################################################################"
echo
