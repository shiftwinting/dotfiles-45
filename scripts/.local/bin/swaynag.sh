#!/usr/bin/env bash
swaynag -t warning -m 'Hello. Do you really want to exit sway? This will end your Wayland session.' \
                                                 -z '🌚️ Suspend' 'systemctl suspend' \
                                                 -z '⚡️ Shutdown' 'shutdown now' \
                                                 -z '🔁 Reboot' 'systemctl -i reboot' \
                                                 -z '🚪 Yes, exit sway' 'swaymsg exit' \
                                                 -z '🔒 Lock' 'swaylock' \
                                                 -s '❌' \
                                                 --button-background=1c1b19 \
                                                 --button-border-size=0px \
                                                 --border=FBB829 \
                                                 --text=D0BFA1 \
                                                 --background=1c1b19 \
                                                 --button-padding=5px \
                                                 --button-margin-right=10px \
                                                 --message-padding=5px \
                                                 --font="Fira Sans 10"
