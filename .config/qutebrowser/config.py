#             __      __
#  ___ ___ __/ /____ / /  _______ _    _____ ___ ____
# / _ `/ // / __/ -_) _ \/ __/ _ \ |/|/ (_-</ -_) __/
# \_, /\_,_/\__/\__/_.__/_/  \___/__,__/___/\__/_/
#  /_
#
# qute://help/index.html

config.load_autoconfig(False)
c.url.default_page = "cosas-de-vido.neocities.org"
c.url.start_pages = ["cosas-de-vido.neocities.org"]

# UI {{{
config.source("colors.py")
c.hints.chars = "asdfghjklie"
c.statusbar.show = "always"
c.messages.timeout = 1000
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.policy.images = 'never'
c.completion.show = "auto"
c.completion.use_best_match = True
c.scrolling.smooth = True
c.completion.height = "35%"
c.completion.quick = False
c.window.title_format = "{private}{perc}qutebrowser"
c.content.fullscreen.overlay_timeout = 500
c.tabs.last_close = "ignore"
c.tabs.show = "multiple"
c.tabs.select_on_remove = "next"
c.tabs.background = True
c.tabs.padding = {
    "left": 1,
    "right": 1,
    "top": 1,
    "bottom": 1,
}
# }}}

# Mappings {{{
c.input.partial_timeout = 500

config.source("unbinds.py")
config.source("keybinds.py")
# }}}

# Shortcuts {{{
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'dd': 'https://duckduckgo.com/?q={}',
    'gg': 'https://encrypted.google.com/search?q={}&pccc=1',
    'sx': 'https://searx.tiekoetter.com/search?q={}',
    'sxng': 'https://searx.be/?q={}',
    'map': 'https://maps.google.com/maps/search/{}',
    'wiki': 'https://es.wikipedia.org/wiki/{}',
    'trad': 'https://translate.google.com/?hl=en&sl=auto&tl=estext={}&op=translate',
    'gh': 'https://github.com/search?q={}',
    'ghs': 'https://github.com/search?q={}&ref=simplesearch',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'wa': 'https://www.wolframalpha.com/input/?i={}',
    'fc': 'https://boards.4channel.org/{}/catalog',
    'lol': 'https://euw.op.gg/champions/{}',
    'scp': 'https://scp-wiki.wikidot.com/scp-{}',
    'af': 'https://www3.animeflv.net/browse?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'rd': 'https://www.reddit.com/r/{}',
    'iv': 'https://farside.link/invidious/{}',
    'nt': 'https://farside.link/nitter/{}',
    'td': 'https://farside.link/teddit/r/{}'
    }
# }}}

# Web content {{{
c.editor.command = ['st', '-e', 'nvim', '{}']
c.downloads.location.directory = "$HOME/Descargas"
c.confirm_quit = ["downloads"]
c.downloads.location.prompt = False
c.content.autoplay = False
c.content.pdfjs = True
c.content.geolocation = False
c.content.canvas_reading = False
c.content.webgl = True
c.content.default_encoding = "utf-8"
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:107.0) Gecko/20100101 Firefox/107.0"
c.content.cookies.accept = "no-3rdparty"
c.completion.open_categories= [ "history" ]

c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [ \
    "https://easylist.to/easylist/easylist.txt", \
    "https://easylist.to/easylist/easyprivacy.txt", \
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt", \
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt", \
    "https://raw.githubusercontent.com/piperun/iploggerfilter/master/filterlist", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt", \
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt" \
    ]
c.content.blocking.hosts.lists = [ \
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts', \
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts', \
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts', \
    'https://curbengh.github.io/malware-filter/urlhaus-filter-online.txt' \
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
# }}}
