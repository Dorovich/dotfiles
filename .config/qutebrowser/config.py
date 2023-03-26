#             __      __
#  ___ ___ __/ /____ / /  _______ _    _____ ___ ____
# / _ `/ // / __/ -_) _ \/ __/ _ \ |/|/ (_-</ -_) __/
# \_, /\_,_/\__/\__/_.__/_/  \___/__,__/___/\__/_/
#  /_
#
# qute://help/index.html

config.load_autoconfig(False)

import os
Terminal = os.getenv("TERMINAL")
Editor = os.getenv("EDITOR")
Homedir = os.getenv("HOME")

# UI {{{
config.source("colors.py")
c.hints.chars = "asdfghjklie"
c.statusbar.show = "always"
c.messages.timeout = 1500
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.policy.images = 'never'
c.completion.show = "auto"
c.completion.use_best_match = True
c.scrolling.smooth = False
c.completion.height = "35%"
c.completion.cmd_history_max_items = 100
c.completion.quick = False
c.window.title_format = "{private}{perc}{current_title}{title_sep}qutebrowser"
c.tabs.title.format = "{audio}{current_title}"
c.completion.timestamp_format = '%H:%M %d/%m'
c.content.fullscreen.overlay_timeout = 500
c.downloads.position = "bottom"
c.tabs.last_close = "ignore"
c.tabs.show = "multiple"
c.tabs.select_on_remove = "next"
c.tabs.background = True
c.tabs.padding = {
    "left": 3,
    "right": 3,
    "top": 1,
    "bottom": 1,
}
c.statusbar.padding = {
    "left": 3,
    "right": 3,
    "top": 1,
    "bottom": 1,
}

# }}}

# Mappings {{{
c.input.partial_timeout = 0

c.aliases['mpv'] = 'spawn --detach mpv --force-window=immediate {url}'

c.bindings.commands = {
    'normal': {
        'ñ': 'set-cmd-text :',
        'ys': 'yank selection', # ya se puede hacer con 'vy'
        'yo': 'yank inline [[{url}][{title}]]',
        'wd': 'close',
        'gA': 'set-cmd-text -s :tab-take',
        'cs': 'config-source',
        'ce': 'spawn --detach ' + Terminal + ' -e ' + Editor + ' '
                + Homedir + '/.config/qutebrowser/config.py',
        ',d': 'spawn --detach ' + Terminal + ' -e lf ' + Homedir + '/Descargas',
        ',m': 'hint links spawn --detach mpv --force-window=immediate {hint-url}',
        ',M': 'spawn --detach mpv --force-window=immediate {url}',
        ',t': 'spawn --userscript translate --text',
        ',T': 'spawn --userscript translate',
        ',pf': 'spawn --userscript password_fill',
        ',ko': 'jseval (function () { '+
                '   var i, elements = document.querySelectorAll("body *");'+
                '   for (i = 0; i < elements.length; i++) {'+
                '       var pos = getComputedStyle(elements[i]).position;'+
                '       if (pos === "fixed" || pos == "sticky") {'+
                '           elements[i].parentNode.removeChild(elements[i]);'+
                '       }'+
                '   }'+
                '})();',
    },
    'insert': {
        '<Ctrl-y>': 'spawn --userscript password_fill',
        '<Ctrl-d>': 'mode-leave',
    },
    'command': {
        '<Ctrl-c>': 'mode-leave',
    },
    'hint': {
        '<Ctrl-c>': 'mode-leave',
    },
}
# }}}

# Search engines {{{
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'dd': 'https://duckduckgo.com/?q={}',
    'gg': 'https://encrypted.google.com/search?q={}',
    'sx': 'https://searx.be/?q={}',
    'map': 'https://maps.google.com/maps/search/{}',
    'wiki': 'https://es.wikipedia.org/wiki/{}',
    'trad': 'https://translate.google.com/?hl=en&sl=auto&tl=en&text={}&op=translate',
    'gh': 'https://github.com/search?q={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'wa': 'https://www.wolframalpha.com/input/?i={}',
    'fc': 'https://boards.4channel.org/{}/catalog',
    'lol': 'https://euw.op.gg/champions/{}',
    'scp': 'https://scp-wiki.wikidot.com/scp-{}',
    'af': 'https://www3.animeflv.net/browse?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'rd': 'https://www.reddit.com/r/{}',
    'bc': 'https://bandcamp.com/search?q={}',
    'gi': 'https://genshin.gg/characters/{}',
    'iv': 'https://farside.link/invidious/{}',
    'nt': 'https://farside.link/nitter/{}',
    'td': 'https://farside.link/teddit/r/{}',
}
# }}}

# Web content {{{
c.url.default_page = "cosas-de-vido.neocities.org"
c.url.start_pages = ["cosas-de-vido.neocities.org"]
c.editor.command = [Terminal, '-e', Editor, '{file}', '-c', 'normal {line}G{column0}l']
c.fileselect.handler = 'external'
c.fileselect.single_file.command = [Terminal, '-c', 'FilePicker', '-e', 'lf', '-selection-path', '{}']
c.fileselect.multiple_files.command = [Terminal, '-c', 'FilePicker', '-e', 'lf', '-selection-path', '{}']
c.downloads.location.directory = "$HOME/Descargas"
c.confirm_quit = ["downloads"]
c.downloads.location.prompt = False
c.content.autoplay = False
c.content.pdfjs = False
c.content.geolocation = False
c.content.canvas_reading = False
c.content.webgl = True
c.content.default_encoding = "utf-8"
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
#c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:110.0) Gecko/20100101 Firefox/110.0"
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36"
c.content.cookies.accept = "no-3rdparty"
c.completion.open_categories= ["history"]
# }}}

# Adblock {{{
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://www.i-dont-care-about-cookies.eu/abp/",
    "https://raw.githubusercontent.com/piperun/iploggerfilter/master/filterlist",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
	"https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-firstparty.txt",
	"https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-social.txt",
	"https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-specific.txt",
	"https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-sugarcoat.txt",
	"https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-firstparty-cname.txt",
    ]
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts',
'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts',
    'https://curbengh.github.io/malware-filter/urlhaus-filter-online.txt',
    ]
# }}}

# Fonts {{{
monospace = "15px 'mononoki NF'"
c.fonts.hints = f"bold {monospace}"
c.fonts.default_family = monospace
c.fonts.completion.category = f"bold {monospace}"
c.fonts.completion.entry = monospace
c.fonts.debug_console = monospace
c.fonts.downloads = monospace
c.fonts.keyhint = monospace
c.fonts.messages.error = monospace
c.fonts.messages.info = monospace
c.fonts.messages.warning = monospace
c.fonts.prompts = monospace
c.fonts.statusbar = monospace
c.fonts.tabs.selected = monospace
c.fonts.tabs.unselected = monospace
# }}}

# Per-domain {{{
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.javascript.can_access_clipboard', True, 'https://github.com/*')
config.set('content.media.audio_capture', True, 'https://discord.com/*')
# }}}
