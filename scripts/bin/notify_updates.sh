#!/bin/bash
updates=$(checkupdates | wc -l)
output=""
if [[ $updates != "0" ]]; then
    notify-send "$updates updates available" -i ""
fi
