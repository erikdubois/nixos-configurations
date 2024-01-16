#!/usr/bin/env bash

sxhkd -c ~/.config/arco-dwm/sxhkd/sxhkdrc &

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
run "nm-applet"
run "variety"
picom -b  --config ~/.config/arco-dwm/picom.conf &
run "numlockx on"
run "volumeicon"
run slstatus &