#!/usr/bin/env bash
swaynag -t warning -m 'Hello. Do you really want to exit sway? This will end your Wayland session.' \
                                                 -b '🌚️ Suspend' 'systemctl suspend' \
                                                 -b '⚡️ Shutdown' 'shutdown now' \
                                                 -b '🔁 Reboot' 'systemctl -i reboot' \
                                                 -b '🚪 Yes, exit sway' 'swaymsg exit' \
                                                 -b '🔒 Lock' 'swaylock' \
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
