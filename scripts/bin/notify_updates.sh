#!/bin/bash
updates=$(checkupdates | wc -l)
output=""
if [[ $updates != "0" ]]; then
    notify-send "📦 $updates"
fi
