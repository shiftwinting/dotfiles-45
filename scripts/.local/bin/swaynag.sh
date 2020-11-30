#!/usr/bin/env bash
swaynag -t warning -m 'Hello. Do you really want to exit sway? This will end your Wayland session.' \
                                                 -b '🌚️Suspend' 'systemctl suspend' \
                                                 -b '⚡️Shutdown' 'shutdown now' \
                                                 -b '🌀️Reboot' 'systemctl -i reboot' \
                                                 -b '🚪️Yes, exit sway' 'swaymsg exit' \
						 -b 'Lock' 'swaylock' \
                                                 --button-background=ff9100 --button-border-size=3px --border=fcc99d --text=092e47
