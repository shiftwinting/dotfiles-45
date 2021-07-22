#!/usr/bin/env bash

time=$(LC_ALL=C TZ='Asia/Kolkata' date +'%A, %d %B')
wttr=$(curl https://wttr.in/?format=4)
echo '<span size="20000" foreground="#ccc">'
echo $wttr'</span>'
