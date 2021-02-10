#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "🔌 %s%% %s" "$CHARGE" "$STATUS"
        else
            printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
        fi
    else
	if [ "$STATUS" = "Charging" ]; then
		printf " %s%%" "$CHARGE"
	elif [ "$CHARGE" -le 10 ]; then
		printf " %s%%" "$CHARGE"
	elif [ "$CHARGE" -gt 10 ] && [ "$CHARGE" -le 25 ]; then
		printf " %s%%" "$CHARGE"
	elif [ "$CHARGE" -gt 25 ] && [ "$CHARGE" -le 50 ]; then
		printf " %s%%" "$CHARGE"
	elif [ "$CHARGE" -gt 50 ] && [ "$CHARGE" -le 75	]; then
		printf " %s%%" "$CHARGE"
	else
		printf " %s%%" "$CHARGE"
	fi
        #printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

