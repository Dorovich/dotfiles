config.load_autoconfig(False)
c.downloads.position = "bottom"
c.editor.command = ['emacs', '{file}']
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.3"
c.content.cookies.accept = "no-3rdparty"

### adblock
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
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
]
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts',
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts',
    'https://curbengh.github.io/malware-filter/urlhaus-filter-online.txt'
]

### mappings
c.bindings.commands = {
    'normal': {
        'ñ': 'cmd-set-text :',
        'yo': 'yank inline [[{url}][{title}]]',
        'gA': 'cmd-set-text -s :tab-take',
        ',d': 'spawn --detach pcmanfm Descargas',
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
    }
}
