/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 3;        /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "mononoki NF:size=12", "Fira Code Nerd Font:size=12" };
static const char dmenufont[]       = "mononoki NF:size=12";
static const char col_gray1[]       = "#151515";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#abb2bf";
static const char col_gray4[]       = "#eeeeee";
static const char col_yellow[]      = "#d19a66";
static const char col_green[]       = "#1e4d3d";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray1 },
	[SchemeSel]  = { col_gray1, col_yellow,  col_green  },
};

static const char *const autostart[] = {
        "sh", "-c", "/usr/bin/nvidia-settings --load-config-only", NULL,
        "nitrogen", "--restore", NULL,
        "picom", NULL,
        "dwm-status", NULL,
	"mpd", NULL,
        "redshift", "-l", "41.39:2.16", "-m", "randr", "-t", "5500:5000", NULL,
        //"/usr/bin/emacs", "--daemon", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class             instance    title       tags mask     isfloating   monitor */
	{ "Gimp",            NULL,       NULL,       0,            1,           -1 },
	{ "Eog",             NULL,       NULL,       0,            1,           -1 },
	{ "mpv",             NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY  Mod4Mask
#define SHIFT   ShiftMask
#define ALT     Mod1Mask
#define CONTROL ControlMask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* teclas raras */
#define ImprPant 0x0000ff61
#define RaiseVol 0x1008FF13
#define LowerVol 0x1008FF11
#define Mute     0x1008FF12

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define CMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]  = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_yellow, "-sf", col_gray1, NULL };
static const char *termcmd[]   = { "st", NULL };
static const char *launchcmd[] = { "rofi", "-show", "drun", NULL };
static const char *filescmd[]  = { "st", "-e", "bash", "-ilc", "nnn", NULL };
static const char *browsrcmd[] = { "qutebrowser.sh", NULL };
static const char *mailcmd[]   = { "thunderbird", NULL };
static const char *lockcmd[]   = { "slock", NULL };

static Key keys[] = {
	/* modifier                     key           function        argument */
	{ MODKEY,                       XK_BackSpace, spawn,          {.v = termcmd} },
	{ MODKEY,                       XK_Return,    spawn,          {.v = dmenucmd} },
	{ MODKEY|SHIFT,                 XK_Return,    spawn,          {.v = launchcmd} },

	{ MODKEY,                       XK_j,         focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,         focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,         setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,         setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_Down,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Up,        focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Left,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_Right,     setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_i,         incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,         incnmaster,     {.i = -1 } },
	{ MODKEY|SHIFT,                 XK_b,         togglebar,      {0} },
	{ MODKEY|SHIFT,                 XK_space,     togglefullscr,  {0} },
	{ MODKEY,                       XK_space,     togglefloating, {0} },
	{ MODKEY,                       XK_z,         zoom,           {0} },
	{ MODKEY,                       XK_Tab,       view,           {0} },
	{ MODKEY|SHIFT,                 XK_Tab,       setlayout,      {0} },
	{ MODKEY,                       XK_c,         killclient,     {0} },
	{ MODKEY|SHIFT,                 XK_q,         quit,           {0} },

     /* Otros programas genericos */
	{ MODKEY,                       XK_Escape,    spawn,          {.v = lockcmd} },
        { MODKEY,                       XK_f,         spawn,          {.v = filescmd} },
        { MODKEY,                       XK_b,         spawn,          {.v = browsrcmd} },
        { MODKEY,                       XK_m,         spawn,          {.v = mailcmd} },
        { MODKEY,                       XK_p,         spawn,          CMD("colpick") },
        { MODKEY,                       XK_v,         spawn,          CMD("tabbed -c vimb -e") },
        //{ MODKEY,                       XK_e,         spawn,          CMD("emacsclient -c -a 'emacs'") },
        //{ MODKEY,                       XK_b,         spawn,          CMD("firefox") },
        //{ MODKEY,                       XK_f,         spawn,          CMD("nautilus") },
        //{ MODKEY,                       XK_p,         spawn,          CMD("pcmanfm") },

     /* Cambiar a disposiciones especificas */
	{ MODKEY|SHIFT,                 XK_t,         setlayout,      {.v = &layouts[0]} }, /* master & stack */
	{ MODKEY|SHIFT,                 XK_f,         setlayout,      {.v = &layouts[1]} }, /* floating */
	{ MODKEY|SHIFT,                 XK_m,         setlayout,      {.v = &layouts[2]} }, /* monocle */

     /* Scripts de dmenu */
        { MODKEY|CONTROL,               XK_p,         spawn,          CMD("~/.config/dmenu/scripts/dm-pass") },
        { MODKEY|CONTROL,               XK_m,         spawn,          CMD("~/.config/dmenu/scripts/dm-mpd-ctl") },
        { MODKEY|CONTROL,               XK_o,         spawn,          CMD("~/.config/dmenu/scripts/dm-soundout") },
        { MODKEY|CONTROL,               XK_k,         spawn,          CMD("~/.config/dmenu/scripts/dm-kill") },
        //{ MODKEY|CONTROL,               XK_w,         spawn,          CMD("~/.config/dmenu/scripts/dm-wifi") },

     /* Capturar pantalla, ventana activa o seccion */
        { MODKEY,                       ImprPant,     spawn,          CMD("maim ~/Im??genes/Capturas/captura_$(date +%s).png") },
        { MODKEY|ALT,                   ImprPant,     spawn,          CMD("maim -i $(xdotool getactivewindow) ~/Im??genes/Capturas/ventana_$(date +%s).png") },
        { MODKEY|SHIFT,                 ImprPant,     spawn,          CMD("maim -s ~/Im??genes/Capturas/recorte_$(date +%s).png") },
        { MODKEY|CONTROL,               ImprPant,     spawn,          CMD("maim -s | xclip -selection clipboard -t image/png") }, /* guarda la captura en el portapapeles */

     /* Control del volumen global */
        { MODKEY|CONTROL,               XK_plus,      spawn,          CMD("mpc volume +5") },
        { MODKEY|CONTROL,               XK_minus,     spawn,          CMD("mpc volume -5") },
        { 0,                            RaiseVol,     spawn,          CMD("pactl set-sink-volume @DEFAULT_SINK@ +5%") },
        { 0,                            LowerVol,     spawn,          CMD("pactl set-sink-volume @DEFAULT_SINK@ -5%") },
        { 0,                            Mute,         spawn,          CMD("pactl set-sink-mute @DEFAULT_SINK@ toggle") },

     /* Cambiar entre monitores */
	{ MODKEY,                       XK_comma,     focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,    focusmon,       {.i = +1 } },
	{ MODKEY|SHIFT,                 XK_comma,     tagmon,         {.i = -1 } },
	{ MODKEY|SHIFT,                 XK_period,    tagmon,         {.i = +1 } },

     /* Gestionar tags */
	{ MODKEY,                       XK_0,         view,           {.ui = ~0 } },
	{ MODKEY|SHIFT,                 XK_0,         tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                         0)
	TAGKEYS(                        XK_2,                         1)
	TAGKEYS(                        XK_3,                         2)
	TAGKEYS(                        XK_4,                         3)
	TAGKEYS(                        XK_5,                         4)
	TAGKEYS(                        XK_6,                         5)
	TAGKEYS(                        XK_7,                         6)
	TAGKEYS(                        XK_8,                         7)
	TAGKEYS(                        XK_9,                         8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

