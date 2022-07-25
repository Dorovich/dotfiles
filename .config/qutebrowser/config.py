#             __      __
#  ___ ___ __/ /____ / /  _______ _    _____ ___ ____
# / _ `/ // / __/ -_) _ \/ __/ _ \ |/|/ (_-</ -_) __/
# \_, /\_,_/\__/\__/_.__/_/  \___/__,__/___/\__/_/
#  /_
#
# qute://help/index.html

config.load_autoconfig(False)
c.url.default_page = "dorovich.github.io/b"
c.url.start_pages = ["dorovich.github.io/b"]

# UI {{{
config.source("colors.py")
c.hints.chars = "asdfghjklie"
c.statusbar.show = "always"
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.policy.images = 'never'
c.completion.show = "auto"
c.completion.use_best_match = True
c.scrolling.smooth = True
c.completion.height = "15%"
c.completion.quick = False
c.window.title_format = "{private}{perc}qutebrowser"
c.content.fullscreen.overlay_timeout = 500
c.tabs.last_close = "ignore"
c.tabs.show = "multiple"
c.tabs.select_on_remove = "prev"
c.tabs.background = True
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 1,
    "bottom": 1,
}
# }}}

# Mappings {{{
c.input.partial_timeout = 500

# Unbinds {{{
config.unbind('co')
config.unbind('cd')
config.unbind('gJ')
config.unbind('gK')
config.unbind('xo')
config.unbind('xO')
config.unbind('go')
config.unbind('gO')
config.unbind('wo')
config.unbind('wO')
config.unbind('ga')
config.unbind('gm')
config.unbind('tl')
config.unbind('wl')
config.unbind('yy')
config.unbind('yY')
config.unbind('yt')
config.unbind('yT')
config.unbind('yd')
config.unbind('yD')
config.unbind('yp')
config.unbind('yP')
config.unbind('ym')
config.unbind('yM')
config.unbind('pp')
config.unbind('pP')
config.unbind('Pp')
config.unbind('PP')
config.unbind('wp')
config.unbind('wP')
config.unbind('ZZ')
config.unbind('ZQ')
config.unbind('tsh')
config.unbind('tSh')
config.unbind('tsH')
config.unbind('tSH')
config.unbind('tsu')
config.unbind('tSu')
config.unbind('tph')
config.unbind('tPh')
config.unbind('tpH')
config.unbind('tpH')
config.unbind('tih')
config.unbind('tIh')
config.unbind('tiH')
config.unbind('tIH')
config.unbind('tiu')
config.unbind('tIu')
config.unbind('tch')
config.unbind('tCh')
config.unbind('tcH')
config.unbind('tCH')
config.unbind('tcu')
config.unbind('tCu')
# }}}

config.bind('K', 'fake-key <PgUp>')
config.bind('J', 'fake-key <PgDown>')
config.bind('ñ', 'clear-messages ;; set-cmd-text :')
config.bind('o', 'clear-messages ;; set-cmd-text -s :open')
config.bind('O', 'clear-messages ;; set-cmd-text :open {url}')
config.bind('t', 'clear-messages ;; set-cmd-text -s :open -t')
config.bind('T', 'clear-messages ;; set-cmd-text :open -t {url}')
config.bind('b', 'clear-messages ;; set-cmd-text -s :quickmark-load')
config.bind('B', 'clear-messages ;; set-cmd-text -s :quickmark-load -t')
config.bind('y', 'yank pretty-url')
config.bind('Y', 'yank selection')
config.bind('p', 'open {clipboard}')
config.bind('P', 'open -t {clipboard}')
config.bind('c', 'download-clear;; clear-messages')
config.bind('D', 'close')
#config.bind('jk', 'mode-leave', 'command')
config.bind('<Ctrl-c>', 'mode-leave', 'command')
config.bind('gh', 'home')
config.bind('xb', 'config-cycle statusbar.show never in-mode')
config.bind('xt', 'config-cycle tabs.show multiple switching')
config.bind('<Ctrl-j>', 'tab-move +')
config.bind('<Ctrl-k>', 'tab-move -')
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
config.bind('<Ctrl-i>', 'forward')
config.bind('<Ctrl-o>', 'back')
config.bind('<Ctrl-e>', 'config-edit')
config.bind('<ctrl+shift+p>', 'open -p')

config.bind(',m', 'hint links spawn mpv {hint-url}')
config.bind(',M', 'spawn mpv {url}')
config.bind(',t', 'spawn --userscript translate --text')
config.bind(',T', 'spawn --userscript translate')
config.bind(',d', 'download-open')
config.bind('<Ctrl-p>', 'spawn --userscript password_fill')
config.bind('<Ctrl-p>', 'spawn --userscript password_fill', 'insert')

config.bind('<Ctrl-d>', 'mode-leave', 'insert')
config.bind('<Ctrl-h>', 'fake-key <Backspace>', 'insert')
config.bind('<Ctrl-a>', 'fake-key <Home>', 'insert')
config.bind('<Ctrl-e>', 'fake-key <End>', 'insert')
config.bind('<Ctrl-b>', 'fake-key <Delete>', 'insert')
config.bind('<Ctrl-w>', 'fake-key <Ctrl-Backspace>', 'insert')
config.bind('<Ctrl-u>', 'fake-key <Shift-Home><Delete>', 'insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End><Delete>', 'insert')
# }}}

# Shortcuts {{{
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'ggl': 'https://encrypted.google.com/search?q={}',
    'sx': 'https://searx.tiekoetter.net/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'rd': 'https://www.reddit.com/r/{}',
    'gh': 'https://github.com/search?q={}',
    'wa': 'https://www.wolframalpha.com/input?i={}',
    'map': 'https://maps.google.com/maps?saddr={}',
    'trad': 'https://translate.google.com/?hl=es&sl=auto&tl=es&text={}&op=translate',
    'wiki': 'https://en.wikipedia.org/wiki/{}',
    'img': 'https://duckduckgo.com/?q={}&t=h_&iax=images&ia=images',
    'mal': 'https://myanimelist.net/search/all?q={}',
    'inv': 'https://yewtu.be/search?q={}',
    'fc': 'https://4chan.org/{}/'
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
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:102.0) Gecko/20100101 Firefox/102.0"
c.content.cookies.accept = "no-3rdparty"
c.completion.open_categories= [ "history" ]

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

# Fonts {{{
monospace = "14px 'mononoki NF'"
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
#c.fonts.tabs.selected = f"bold {monospace}"
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
