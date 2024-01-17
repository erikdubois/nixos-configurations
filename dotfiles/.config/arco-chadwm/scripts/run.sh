#!/usr/bin/env bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "nm-applet"
run "variety"
run "blueberry-tray"
picom -b  --config ~/.config/arco-chadwm/picom/picom.conf &
run "numlockx on"
run "volumeicon"
sxhkd -c ~/.config/arco-chadwm/sxhkd/sxhkdrc &
pkill bar.sh
dash ~/.config/arco-chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
