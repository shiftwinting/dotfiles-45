#!/bin/sh
updates=$(checkupdates | wc -l)
output=""
if [[ $updates != "0" ]]; then
	output=$updates" "
fi
echo -e "$output"
