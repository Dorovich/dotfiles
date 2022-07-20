#!/bin/bash

qutebrowser
wait
echo "DELETE FROM cookies WHERE host_key NOT LIKE '%github.com%' AND host_key NOT LIKE '%atenea.upc.edu%' AND host_key NOT LIKE '%raco.fib.upc.edu%' AND host_key NOT LIKE '%discos.fib.upc.edu%' AND host_key NOT LIKE '%jutge.org%' AND host_key NOT LIKE '%github.com%' AND host_key NOT LIKE '%itch.io%' AND host_key NOT LIKE '%google.com%' AND host_key NOT LIKE '%accounts.google.com%' AND host_key NOT LIKE '%youtube.com%' AND host_key NOT LIKE '%soundcloud.com%' AND host_key NOT LIKE '%duckduckgo.com%' AND host_key NOT LIKE '%reddit.com%' AND host_key NOT LIKE '%voidlinux.org%' AND host_key NOT LIKE '%discord.com%' AND host_key NOT LIKE '%wikipedia.org%' AND host_key NOT LIKE '%yewtu.be%' AND host_key NOT LIKE '%mega.nz%' AND host_key NOT LIKE '%store.steampowered.com%' AND host_key NOT LIKE '%steamcommunity.com%' AND host_key NOT LIKE '%mangadex.org%' AND host_key NOT LIKE '%twitch.tv%' AND host_key NOT LIKE '%wallapop.com%' AND host_key NOT LIKE '%5e.tools%';" | sqlite3 ~/.local/share/qutebrowser/webengine/Cookies
echo "DELETE FROM History; DELETE FROM CompletionHistory;" | sqlite3 ~/.local/share/qutebrowser/history.sqlite
if [ -f ~/.local/share/qutebrowser/cmd-history ]; then rm ~/.local/share/qutebrowser/cmd-history; fi
if [ -d ~/.cache/qutebrowser ]; then rm -rf ~/.cache/qutebrowser/; fi
