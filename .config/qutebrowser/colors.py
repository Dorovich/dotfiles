import subprocess

def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")

Foreground = xresources["*.foreground"]
Background = xresources["*.background"]
Accent = xresources["*.color6"]
AltAccent = xresources["*.color3"]
Error = xresources["*.color1"]
Warn = xresources["*.color9"]
Dimmed = xresources["*.color8"]
Private = xresources["*.color5"]
Shiny = xresources["*.cursorColor"]
AltShiny = xresources["*.color14"]

# Completions
c.colors.completion.fg = Foreground
c.colors.completion.odd.bg = Background
c.colors.completion.even.bg = Background
c.colors.completion.category.fg = AltAccent
c.colors.completion.category.bg = Background
c.colors.completion.category.border.top = Background
c.colors.completion.category.border.bottom = Background
c.colors.completion.item.selected.fg = Foreground
c.colors.completion.item.selected.bg = Accent
c.colors.completion.item.selected.border.top = Background
c.colors.completion.item.selected.border.bottom = Background
c.colors.completion.match.fg = Warn
c.colors.completion.item.selected.match.fg = Warn
c.colors.completion.scrollbar.fg = Foreground
c.colors.completion.scrollbar.bg = Background

# Contextmenu
c.colors.contextmenu.disabled.bg = Dimmed
c.colors.contextmenu.disabled.fg = Foreground
c.colors.contextmenu.menu.bg = Background
c.colors.contextmenu.menu.fg =  Foreground
c.colors.contextmenu.selected.bg = Background
c.colors.contextmenu.selected.fg = Foreground

# Downloads
c.colors.downloads.bar.bg = Background
c.colors.downloads.start.bg = Accent
c.colors.downloads.start.fg = Foreground
c.colors.downloads.stop.bg = Error
c.colors.downloads.stop.fg = Foreground
c.colors.downloads.error.fg = Foreground

# Hints
c.colors.hints.fg = Background
c.colors.hints.bg = Shiny
c.colors.hints.match.fg = Foreground
c.colors.keyhint.fg = Foreground
c.colors.keyhint.suffix.fg = Foreground
c.colors.keyhint.bg = Background

# Other messages
c.colors.messages.error.fg = Foreground
c.colors.messages.error.bg = Error
c.colors.messages.error.border = Error
c.colors.messages.warning.fg = Background
c.colors.messages.warning.bg = Warn
c.colors.messages.warning.border = Warn
c.colors.messages.info.fg = Foreground
c.colors.messages.info.bg = Background
c.colors.messages.info.border = Background

# Prompts
c.colors.prompts.fg = Foreground
c.colors.prompts.border = Background
c.colors.prompts.bg = Dimmed
c.colors.prompts.selected.bg = Background

# Statusbar
c.colors.statusbar.normal.fg = Foreground
c.colors.statusbar.normal.bg = Background
c.colors.statusbar.insert.fg = Foreground
c.colors.statusbar.insert.bg = Accent
c.colors.statusbar.passthrough.fg = Shiny
c.colors.statusbar.passthrough.bg = Background
c.colors.statusbar.private.fg = Private
c.colors.statusbar.private.bg = Background
c.colors.statusbar.caret.fg = Accent
c.colors.statusbar.caret.bg = Background
c.colors.statusbar.caret.selection.fg = Accent
c.colors.statusbar.caret.selection.bg = Background
c.colors.statusbar.progress.bg = Accent

c.colors.statusbar.command.fg = Foreground
c.colors.statusbar.command.bg = Background
c.colors.statusbar.command.private.fg = Private
c.colors.statusbar.command.private.bg = Background

c.colors.statusbar.url.fg = Shiny
c.colors.statusbar.url.error.fg = Error
c.colors.statusbar.url.hover.fg = AltShiny
c.colors.statusbar.url.success.http.fg = Shiny
c.colors.statusbar.url.success.https.fg = Shiny
c.colors.statusbar.url.warn.fg = Warn

# Tabs
c.colors.tabs.bar.bg = Background
c.colors.tabs.indicator.start = Background
c.colors.tabs.indicator.stop = AltAccent
c.colors.tabs.indicator.error = Error
c.colors.tabs.odd.fg = Foreground
c.colors.tabs.odd.bg = Background
c.colors.tabs.even.fg = Foreground
c.colors.tabs.even.bg = Background
c.colors.tabs.pinned.even.bg = Background
c.colors.tabs.pinned.even.fg = Foreground
c.colors.tabs.pinned.odd.bg = Background
c.colors.tabs.pinned.odd.fg = Foreground
c.colors.tabs.pinned.selected.even.bg = Accent
c.colors.tabs.pinned.selected.even.fg = Foreground
c.colors.tabs.pinned.selected.odd.bg = Accent
c.colors.tabs.pinned.selected.odd.fg = Foreground
c.colors.tabs.selected.odd.bg = Accent
c.colors.tabs.selected.odd.fg = Foreground
c.colors.tabs.selected.even.bg = Accent
c.colors.tabs.selected.even.fg = Foreground

# Webpage related
c.colors.webpage.bg = Background
