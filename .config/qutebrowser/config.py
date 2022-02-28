config.load_autoconfig(False)
c.content.geolocation = False
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:84.0) Gecko/20100101 Firefox/84.0"
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.colors.webpage.darkmode.enabled = True
c.content.canvas_reading = False
c.content.webgl = False
c.content.autoplay = False

c.content.blocking.adblock.lists = [ \
        "https://easylist.to/easylist/easylist.txt", \
        "https://easylist.to/easylist/easyprivacy.txt", \
        "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt", \
        "https://easylist.to/easylist/fanboy-annoyance.txt", \
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt" \
        ]

c.content.blocking.enabled = True
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.method = 'both'

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`.
c.content.cookies.accept = "no-unknown-3rdparty"

# Some bindings on normal mode
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind(',m', 'hint links spawn mpv --force-window=immediate {hint-url}')

# Default search engine, and shortcuts to other. use after :open (-t/-w)
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'am': 'https://www.amazon.com/s?k={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'ggl': 'https://www.google.com/search?q={}',
    're': 'https://www.reddit.com/r/{}',
    'wiki': 'https://en.wikipedia.org/wiki/{}',
    'yt': 'https://www.youtube.com/results?search_query={}'
    }

# Chars used for hint strings.
c.hints.chars = "asdfghjklie"

# Font config
monospace = "12px 'FiraCode NF'"

c.fonts.hints = "bold 13px 'Ubuntu Mono'"
c.fonts.default_family = "11px 'FiraCode NF'"
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

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
c.downloads.location.prompt = False
c.downloads.location.directory = "$HOME/Descargas"

# When to show the autocompletion window.
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = "auto"

# Whether quitting the application requires a confirmation.
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ["downloads"]

# Padding around text for tabs
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 1,
    "bottom": 1,
}

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
c.scrolling.smooth = True

# The height of the completion, in px or as percentage of the window.
c.completion.height = "20%"

# Move on to the next part when there's only one possible completion left
c.completion.quick = False


# The format to use for the window title. The following placeholders are
# defined:
# `{perc}`: Percentage as a string like `[10%]`.
# `{perc_raw}`: Raw percentage, e.g. `10`.
# `{current_title}`: Title of the current web page.
# `{title_sep}`: The string `" - "` if a title is set, empty otherwise.
# `{index}`: Index of this tab.
# `{aligned_index}`: Index of this tab padded with spaces to have the same width.
# `{id}`: Internal tab ID of this tab.
# `{scroll_pos}`: Page scroll position.
# `{host}`: Host of the current web page.
# `{backend}`: Either `webkit` or `webengine`
# `{private}`: Indicates when private mode is enabled.
# `{current_url}`: URL of the current web page.
# `{protocol}`: Protocol (http/https/...) of the current web page.
# `{audio}`: Indicator for audio/mute status.
c.window.title_format = "{private}{perc}{current_title}{title_sep}qutebrowser"

