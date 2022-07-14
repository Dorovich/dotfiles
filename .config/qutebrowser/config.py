# General {{{
config.load_autoconfig(False)
c.downloads.location.prompt = False
c.downloads.location.directory = "$HOME/Descargas"
c.confirm_quit = ["downloads"]
c.content.autoplay = False
c.content.pdfjs = True
c.hints.chars = "asdfghjklie"
c.tabs.show = "switching"
c.statusbar.show = "in-mode"
c.tabs.last_close = "ignore"  # "close" alternativamente
c.content.default_encoding = "utf-8"
c.content.fullscreen.overlay_timeout = 500
c.input.partial_timeout = 500
c.editor.command = ['st', '-e', 'nvim', '{}']
# }}}

# UI {{{
config.source("colors.py")
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.policy.images = 'never'
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
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:102.0) Gecko/20100101 Firefox/102.0"
c.content.canvas_reading = False
c.content.webgl = True
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
config.bind('ñ', 'clear-messages ;; set-cmd-text :')
config.bind('o', 'clear-messages ;; set-cmd-text -s :open')
config.bind('O', 'clear-messages ;; set-cmd-text :open {url}')
config.bind('t', 'clear-messages ;; set-cmd-text -s :open -t')
config.bind('T', 'clear-messages ;; set-cmd-text :open -t {url}')
config.bind('y', 'yank selection')
config.bind('Y', 'yank pretty-url')
config.bind('p', 'open {clipboard}')
config.bind('P', 'open -t {clipboard}')
config.bind('cm', 'clear-messages')
config.bind('cs', 'config-source')
config.bind('jk', 'mode-leave', 'command')

config.bind('xb', 'config-cycle statusbar.show never in-mode')
config.bind('xt', 'config-cycle tabs.show multiple switching')
config.bind('xx', 'config-cycle statusbar.show in-mode never;; config-cycle tabs.show multiple switching')

config.bind(',m', 'hint links spawn mpv {hint-url}')
config.bind(',M', 'spawn mpv {url}')
config.bind(',t', 'spawn --userscript translate --text')
config.bind(',T', 'spawn --userscript translate')
config.bind(',d', 'download-open')

config.bind('<Ctrl-j>', 'tab-move +')
config.bind('<Ctrl-k>', 'tab-move -')
config.bind('<Ctrl-i>', 'forward')
config.bind('<Ctrl-o>', 'back')

config.bind('<Ctrl-p>', 'spawn --userscript password_fill')
config.bind('<Ctrl-p>', 'spawn --userscript password_fill', 'insert')

config.bind('<Ctrl-h>', 'fake-key <Backspace>', 'insert')
config.bind('<Ctrl-a>', 'fake-key <Home>', 'insert')
config.bind('<Ctrl-e>', 'fake-key <End>', 'insert')
config.bind('<Ctrl-d>', 'fake-key <Delete>', 'insert')
config.bind('<Ctrl-w>', 'fake-key <Ctrl-Backspace>', 'insert')
config.bind('<Ctrl-u>', 'fake-key <Shift-Home><Delete>', 'insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End><Delete>', 'insert')
# }}}

# URL {{{
c.url.searchengines = {
    'DEFAULT': 'https://searx.tiekoetter.com/search?q={}',
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
    'inv': 'https://yewtu.be/search?q={}'
    }
c.url.default_page = "dorovich.github.io"
c.url.start_pages = ["dorovich.github.io"]
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
monospace = "16px 'mononoki NF'"
c.fonts.hints = "bold 16px 'Ubuntu Mono'"
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
c.fonts.tabs.selected = f"bold {monospace}"
c.fonts.tabs.unselected = monospace
# }}}
