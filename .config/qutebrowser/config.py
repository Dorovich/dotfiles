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
c.completion.cmd_history_max_items = 100
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
c.input.partial_timeout = 0

c.bindings.default = {}
c.bindings.commands = {
    'normal': { # {{{
        'h': 'scroll left',
        'j': 'scroll down',
        'k': 'scroll up',
        'l': 'scroll right',
        'J': 'scroll-page 0 0.5',
        'K': 'scroll-page 0 -0.5',
        'i': 'mode-enter insert',
        'f': 'hint',
        'F': 'hint all tab',
        'r': 'reload',
        'R': 'reload -f',
        '/': 'set-cmd-text /',
        '?': 'set-cmd-text ?',
        ':': 'set-cmd-text :',
        'ñ': 'set-cmd-text :',
        'o': 'set-cmd-text -s :open',
        'O': 'set-cmd-text :open {url}',
        't': 'set-cmd-text -s :open -t',
        'T': 'set-cmd-text :open -t {url}',
        'b': 'set-cmd-text -s :quickmark-load',
        'B': 'set-cmd-text -s :quickmark-load -t',
        'y': 'yank pretty-url',
        'Y': 'yank selection',
        'p': 'open {clipboard}',
        'P': 'open -t {clipboard}',
        'd': 'tab-close',
        'D': 'close',
        'm': 'quickmark-save',
        'M': 'bookmark-add',
        'u': 'undo',
        'U': 'undo -w',
        'v': 'mode-enter caret',
        'V': 'mode-enter caret;; selection-toggle --line',
        'gg': 'scroll-to-perc 0',
        'G': 'scroll-to-perc 100',
        'gh': 'home',
        'gc': 'config-edit',
        'gd': 'spawn st -e lf /home/vido25/Descargas',
        'gi': 'hint inputs --first',
        'xb': 'config-cycle statusbar.show never always',
        'xt': 'config-cycle tabs.show multiple never',
        'xc': 'history-clear',
        'wi': 'devtools',
        'c': 'download-clear;; clear-messages',
        '+': 'zoom-in',
        '-': 'zoom-out',
        '=': 'zoom',
        '<F5>': 'reload',
        '<Ctrl-F5>': 'reload',
        '<Ctrl-w>': 'tab-close',
        '<Ctrl-t>': 'open -t',
        '<Ctrl-q>': 'close',
        '<Ctrl-p>': 'tab-pin',
        '<Ctrl-n>': 'open -w',
        '<Ctrl-Shift-n>': 'open -p',
        '<Ctrl-Shift-t>': 'undo',
        '<Ctrl-j>': 'tab-move +',
        '<Ctrl-k>': 'tab-move -',
        '<Ctrl-h>': 'tab-prev',
        '<Ctrl-l>': 'tab-next',
        '<Ctrl-i>': 'forward',
        '<Ctrl-o>': 'back',
        '<Ctrl-u>': 'scroll-page 0 -0.5',
        '<Ctrl-d>': 'scroll-page 0 0.5',
        '<Ctrl-b>': 'scroll-page 0 -1',
        '<Ctrl-f>': 'scroll-page 0 1',
        '<Ctrl-s>': 'stop',
        '<Ctrl-a>': 'navigate increment',
        '<Ctrl-x>': 'navigate decrement',
        '<Ctrl-z>': 'mode-enter passthrough',
        '<Ctrl-Shift-p>': 'open -p',
        ',m': 'hint links spawn mpv {hint-url}',
        ',M': 'spawn mpv {url}',
        ',t': 'spawn --userscript translate --text',
        ',T': 'spawn --userscript translate',
        ',d': 'download-open',
        '<Ctrl-y>': 'spawn --userscript password_fill',
        '<Alt-1>': 'tab-focus 1',
        '<Alt-2>': 'tab-focus 2',
        '<Alt-3>': 'tab-focus 3',
        '<Alt-4>': 'tab-focus 4',
        '<Alt-5>': 'tab-focus 5',
        '<Alt-6>': 'tab-focus 6',
        '<Alt-7>': 'tab-focus 7',
        '<Alt-8>': 'tab-focus 8',
        '<Alt-9>': 'tab-focus -1',
        ';i': 'hint all images',
        ';b': 'hint all tab-bg',
        ';f': 'hint all tab-fg',
        ';h': 'hint all hover',
        ';i': 'hint images',
        ';I': 'hint images tab',
        ';o': 'hint links fill :open {hint-url}',
        ';O': 'hint links fill :open -t -r {hint-url}',
        ';y': 'hint links yank',
        ';Y': 'hint links yank-primary',
        ';r': 'hint --rapid links tab-bg',
        ';R': 'hint --rapid links window',
        ';d': 'hint links download',
        ';t': 'hint inputs',
    }, # }}}
    'insert': { # {{{
        '<Ctrl-y>': 'spawn --userscript password_fill',
        '<Ctrl-d>': 'mode-leave',
        '<Ctrl-h>': 'fake-key <Backspace>',
        '<Ctrl-a>': 'fake-key <Home>',
        '<Ctrl-e>': 'fake-key <End>',
        '<Ctrl-b>': 'fake-key <Delete>',
        '<Ctrl-w>': 'fake-key <Ctrl-Backspace>',
        '<Ctrl-u>': 'fake-key <Shift-Home><Delete>',
        '<Ctrl-k>': 'fake-key <Shift-End><Delete>',
        '<Escape>': 'mode-leave',
    }, # }}}
    'command': { # {{{
        '<Ctrl-c>': 'mode-leave',
        '<Ctrl+p>': 'command-history-prev',
        '<Ctrl+n>': 'command-history-next',
        '<Up>': 'completion-item-focus --history prev',
        '<Down>': 'completion-item-focus --history next',
        '<Shift+Tab>': 'completion-item-focus prev',
        '<Tab>': 'completion-item-focus next',
        '<Ctrl+Tab>': 'completion-item-focus next-category',
        '<Ctrl+Shift+Tab>': 'completion-item-focus prev-category',
        '<PgDown>': 'completion-item-focus next-page',
        '<PgUp>': 'completion-item-focus prev-page',
        '<Ctrl+d>': 'completion-item-del',
        '<Shift+Del>': 'completion-item-del',
        '<Ctrl+Shift+c>': 'completion-item-yank --sel',
        '<Return>': 'command-accept',
        '<Ctrl+Return>': 'command-accept --rapid',
        '<Ctrl+b>': 'rl-backward-char',
        '<Ctrl+f>': 'rl-forward-char',
        '<Alt+b>': 'rl-backward-word',
        '<Alt+f>': 'rl-forward-word',
        '<Ctrl+a>': 'rl-beginning-of-line',
        '<Ctrl+e>': 'rl-end-of-line',
        '<Ctrl+u>': 'rl-unix-line-discard',
        '<Ctrl+k>': 'rl-kill-line',
        '<Alt+d>': 'rl-kill-word',
        '<Ctrl+w>': 'rl-rubout " "',
        '<Ctrl+Shift+w>': 'rl-filename-rubout',
        '<Alt+Backspace>': 'rl-backward-kill-word',
        '<Ctrl+y>': 'rl-yank',
        '<Ctrl+?>': 'rl-delete-char',
        '<Ctrl+h>': 'rl-backward-delete-char',
        '<Escape>': 'mode-leave',
    }, # }}}
    'hint': { # {{{
        '<Return>': 'hint-follow',
        '<Ctrl+r>': 'hint --rapid links tab-bg',
        '<Ctrl+f>': 'hint links',
        '<Ctrl+b>': 'hint all tab-bg',
        '<Escape>': 'mode-leave',
    }, # }}}
    'passthrough': { # {{{
        '<Shift-Escape>': 'mode-leave',
    }, # }}}
    'prompt': { # {{{
        '<Return>': 'prompt-accept',
        '<Ctrl+x>': 'prompt-open-download',
        '<Ctrl+p>': 'prompt-open-download --pdfjs',
        '<Shift+Tab>': 'prompt-item-focus prev',
        '<Up>': 'prompt-item-focus prev',
        '<Tab>': 'prompt-item-focus next',
        '<Down>': 'prompt-item-focus next',
        '<Alt+y>': 'prompt-yank',
        '<Alt+Shift+y>': 'prompt-yank --sel',
        '<Ctrl+b>': 'rl-backward-char',
        '<Ctrl+f>': 'rl-forward-char',
        '<Alt+b>': 'rl-backward-word',
        '<Alt+f>': 'rl-forward-word',
        '<Ctrl+a>': 'rl-beginning-of-line',
        '<Ctrl+e>': 'rl-end-of-line',
        '<Ctrl+u>': 'rl-unix-line-discard',
        '<Ctrl+k>': 'rl-kill-line',
        '<Alt+d>': 'rl-kill-word',
        '<Ctrl+w>': 'rl-rubout " "',
        '<Ctrl+Shift+w>': 'rl-filename-rubout',
        '<Alt+Backspace>': 'rl-backward-kill-word',
        '<Ctrl+?>': 'rl-delete-char',
        '<Ctrl+h>': 'rl-backward-delete-char',
        '<Ctrl+y>': 'rl-yank',
        '<Escape>': 'mode-leave',
    }, # }}}
    'register': { # {{{
        '<Escape>': 'mode-leave',
    }, # }}}
    'yesno': { # {{{
        '<Return>': 'prompt-accept',
        'y': 'prompt-accept yes',
        'n': 'prompt-accept no',
        'Y': 'prompt-accept --save yes',
        'N': 'prompt-accept --save no',
        '<Alt+y>': 'prompt-yank',
        '<Alt+Shift+y>': 'prompt-yank --sel',
        '<Escape>': 'mode-leave',
    }, # }}}
}
# }}}

# Search engines {{{
c.url.searchengines = {
    'DEFAULT': 'https://searx.be/?q={}',
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
#c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:110.0) Gecko/20100101 Firefox/110.0"
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; rv:110.0) Gecko/20100101 Firefox/110.0"
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
config.set('content.media.audio_capture', True, 'https://discord.com/*')
# }}}
