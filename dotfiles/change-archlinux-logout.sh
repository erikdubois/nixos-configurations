#!/usr/bin/env bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 		: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

FIND="archlinux-logout"
REPLACE="powerm"

find .config/  -type f -executable -exec sed -i "s/$FIND/$REPLACE/g" {} \;
find .config/  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;


echo "Done"