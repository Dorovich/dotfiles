#!/bin/env bash

set -euo pipefail

### Descomentar esto si se quiere que el cliente se abra si no se está ejecutando.
### Si se deja comentado, steam se abrirá igualmente al seleccionar un juego y se ejecutará de fondo.
#
# if [[ "$(pidof steam)" -eq "" ]]; then
#    exec steam
# fi

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

exec steam steam://rungameid/$selid
