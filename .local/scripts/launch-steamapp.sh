#!/bin/env bash

set -euo pipefail

if [[ "$(pidof steam)" -eq "" ]]; then
    steam 2&> /dev/null 1&> /dev/null & disown
    exit 1
fi

files=~/.steam/debian-installation/steamapps/appmanifest_*

declare -A games

for f in $files; do
    name=$(sed -n '/"name"/p' $f | cut -d '"' -f4)
    if [[ $name != *"Steam"* && $name != *"Proton"* ]]; then
        appid=$(sed -n '/"appid"/p' $f | cut -d '"' -f4)
        games[$name]=$appid
    fi
done

selname=$(printf '%s\n' "${!games[@]}" | sort | dmenu -i -l 10 -p 'Select game:' "$@")
selid=${games[${selname}]}

steam steam://rungameid/$selid
