#!/usr/bin/env bash
#autostart this for bar info

speed="0B/s" 

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
	core_0=$(printf "%d" $(sensors|grep 'Core 0:' | awk '{ print $3}') 2>/dev/null)
	core_1=$(printf "%d" $(sensors|grep 'Core 1:' | awk '{ print $3}') 2>/dev/null)
	core_2=$(printf "%d" $(sensors|grep 'Core 2:' | awk '{ print $3}') 2>/dev/null)
	core_3=$(printf "%d" $(sensors|grep 'Core 3:' | awk '{ print $3}') 2>/dev/null)
	#total=$((core_0+core_1+core_2+core_3))
	printf "^c#3b414d^ ^b#7ec7a2^ CPU:"
	printf "^c#3b414d^^b#7ec7a2^ $cpu_val"
	printf "/$(($((core_0+core_1+core_2+core_3))/4))°C"
}

#update_icon() {
#  printf "^c#7ec7a2^ "
#}

#pkg_updates() {
#  updates=$(doas xbps-install -un | wc -l) # void
#  # updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
#  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)
#
#  if [ -z "$updates" ]; then
#    printf "^c#7ec7a2^ Fully Updated"
#  else
#    printf "^c#7ec7a2^ $updates"" updates"
#  fi
#}

#audio
audio(){
	if [ "$(amixer get Master toggle | xargs | awk '{print $NF}')" = "[off]" ]; then
		printf "^c#7aa2f7^婢 %d"$(amixer sget Master | awk -F"[][]" '/Left/ { print $2 }')
	else
		printf "^c#7aa2f7^ %d"$(amixer sget Master | awk -F"[][]" '/Left/ { print $2 }')
	fi

	if [ $(fish -c "headset|tail -n 1|cut -d' ' -f2") = "successful" ]; then
		printf "/"
		bluetooth_battery 20:20:10:21:A4:8C | cut -d' ' -f6
	fi
}

# battery
batt() {
	battery_state=$(fish -c 'battery state|sed s/","//')
	if fish -c "string match -r 'Unknown|Charging' $battery_state &>/dev/null"; then
		printf "^c#3b414d^^b#7ec7a2^ "
	else
			printf "^c#3b414d^^b#7ec7a2^ "
	fi
  printf "^c#3b414d^^b#7ec7a2^ $(acpi | sed "s/,//g" | awk '{if ($3 == "Discharging"){print $4; exit} else {print $4""}}' | tr -d "\n")%"
}

brightness() {

  backlight() {
    backlight="$(xbacklight -get)"
    echo -e "$backlight"
  }

  printf "^c#1e222a^^b#70A1C1^  "
  printf "^c#1e222a^^B#81A1C1^%.0f\n" $(backlight)
}

mem() {
  printf "^c#1e222a^^b#70A1C1^  "
  printf "^c#1e222a^^b#81A1C1^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

#wlan() {
#  case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
#  up) printf "^c#3b414d^ ^b#7aa2f7^ 󰤨 ^d^%s" " ^c#7aa2f7^Connected" ;;
#  down) printf "^c#3b414d^ ^b#7aa2f7^ 󰤭 ^d^%s" " ^c#7aa2f7^Disconnected" ;;
#  esac
#}

netspeed(){
	speed=$(fish -c "traffic wlp3s0 | tail -n 1 | cut -d' ' -f 3")
}

ssd-price-now() {
	value=$(cat /tmp/ssd)
	if test $(echo $value| rev | cut -c4- |rev) -gt 0;then
		printf "^c#1e222a^^b#70A1C1^ BX500:"
		printf "^c#1e222a^ ^b#81A1C1^$value"
	fi
}

clock() {
  printf "^c#1e222a^^b#668ee3^ 羽"
  printf "^c#1e222a^ ^b#7aa2f7^ $(date '+%a %b %d, %r') "
}

while true; do
	[ $(($SECONDS % 2)) -eq 0 ] && netspeed &
	[ $SECONDS -eq 20 ] || [ $(($SECONDS % 1800)) -eq 0 ] && fish -c 'ssd-price &>/tmp/ssd' & #$SECONDS=time it has been from script start
	[ "$(cat /proc/acpi/button/lid/LID0/state | awk -F': ' '{print $2}' | xargs)" = "closed" ] && betterlockscreen -l -tf "%I:%M %p" -t "Don't touch my Machine!"
	sleep .5 && xsetroot -name "$(printf "^c#7aa2f7^龍 $speed") $(audio) $(ssd-price-now) $(batt) $(brightness) $(cpu) $(mem) $(clock)"
done
