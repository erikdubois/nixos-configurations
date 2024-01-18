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

FIND="virtualbox"
REPLACE="VirtualBox"

find . -name 'sxhkdrc*'  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;
find . -name '*.xml'  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;
find . -name '*.lua'  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;
find . -name 'config*'  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;
find . -name '*.conf'  -type f -exec sed -i "s/$FIND/$REPLACE/g" {} \;


echo "Done"