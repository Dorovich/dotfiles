# General {{{
config.load_autoconfig(False)
c.downloads.location.prompt = False
c.downloads.location.directory = "$HOME/Descargas"
c.confirm_quit = ["downloads"]
c.content.autoplay = False
c.content.pdfjs = True
c.hints.chars = "asdfghjklie"
c.tabs.show = "multiple"
c.tabs.last_close = "ignore"  # "close" alternativamente
c.content.default_encoding = "utf-8"
c.qt.force_software_rendering = "qt-quick"
# }}}

# UI {{{
config.source("colors.py")
c.colors.webpage.prefers_color_scheme_dark = True
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.policy.images = 'smart'
c.completion.show = "auto"
c.completion.use_best_match = True
c.scrolling.smooth = True
c.completion.height = "20%"
c.completion.quick = False
c.window.title_format = "{private}{perc}qutebrowser"
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 1,
    "bottom": 1,
}
# }}}

# Privacy {{{
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.content.geolocation = False
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:97.0) Gecko/20100101 Firefox/97.0"
c.content.canvas_reading = False
c.content.webgl = False
c.content.cookies.accept = "no-3rdparty"
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [ \
    "https://easylist.to/easylist/easylist.txt", \
    "https://easylist.to/easylist/easyprivacy.txt", \
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt", \
    "https://easylist.to/easylist/fanboy-annoyance.txt", \
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt", \
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt", \
    "https://raw.githubusercontent.com/piperun/iploggerfilter/master/filterlist", \
    "https://raw.githubusercontent.com/gwarser/filter-lists/master/lan-block.txt", \
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

# Keys {{{
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show multiple never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show multiple never')

config.bind(',m', 'hint links spawn mpv {hint-url}')
config.bind(',M', 'spawn mpv {url}')
config.bind(',t', 'spawn --userscript translate --text')
config.bind(',T', 'spawn --userscript translate')
config.bind(",d", "download-open")

config.bind("<Ctrl-Shift-J>", "tab-move +")
config.bind("<Ctrl-Shift-K>", "tab-move -")

config.bind("<Ctrl-p>", "spawn --userscript ~/.config/qutebrowser/userscripts/password_fill")

config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
# }}}

# URL {{{
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
#   'ddg': 'https://duckduckgo.com/?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
#   'aw': 'https://wiki.archlinux.org/?search={}',
    'rd': 'https://www.reddit.com/r/{}',
    'wa': 'https://www.wolframalpha.com/input?i={}',
    'gh': 'https://github.com/search?q={}',
    'ggl': 'https://www.google.com/search?q={}',
#   'sx': 'https://paulgo.io/search?q={}',
#   'yan': 'https://yandex.com/search/?text={}',
    'wiki': 'https://en.wikipedia.org/wiki/{}',
    'trad': 'https://translate.google.com/?hl=es&sl=auto&tl=es&text={}&op=translate'
    }
c.url.default_page = "file:///home/vido25/.config/qutebrowser/homepage/index.html"
c.url.start_pages = ["file:///home/vido25/.config/qutebrowser/homepage/index.html"]
# }}}

# Per-domain Settings {{{
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
# }}}

# Font {{{
monospace = "12px 'FiraCode NF'"
c.fonts.hints = "bold 16px 'Ubuntu Mono'"
c.fonts.default_family = "12px 'FiraCode NF'"
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
