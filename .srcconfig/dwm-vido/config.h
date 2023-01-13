/* See LICENSE file for copyright and license details. */

#define TERMINAL "st"
#define TERMCLASS "St"
#define BROWSER "firefox"

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

static const char *fonts[]          = { "mononoki NF:pixelsize=12" };
static const char col_white[]       = "#ABB2BF";
static const char col_yellow[]      = "#D19A66";
static const char col_gray[]        = "#5C6370";
static const char col_darkgray[]    = "#151515";

static const char *colors[][3]      = {
	/*               fg         bg              border   */
	[SchemeNorm] = { col_gray,  col_darkgray,   col_darkgray },
	[SchemeSel]  = { col_white, col_yellow,     col_yellow  },
};

static const char *const autostart[] = {
	"setxkbmap", "es", NULL,
	"xset", "r", "rate", "300", "35", NULL,
	"nitrogen", "--restore", NULL,
	"picom", NULL,
	"mpd", NULL,
        "redshift", "-l", "41.39:2.16", "-m", "randr", "-t", "5500:5000", NULL,
        "/usr/bin/nvidia-settings", "-l", NULL,
        "emacs", "--daemon", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ TERMCLASS, NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
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
#define MODKEY Mod4Mask
#define SHIFT ShiftMask
#define ALT Mod1Mask
#define CTRL ControlMask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                   KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|CTRL,              KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|SHIFT,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|CTRL|SHIFT,        KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD, XK_j,     ACTION##stack, {.i = INC(+1) } }, \
	{ MOD, XK_k,     ACTION##stack, {.i = INC(-1) } }, \
	{ MOD, XK_grave, ACTION##stack, {.i = PREVSEL } }, \
	{ MOD, XK_a,     ACTION##stack, {.i = 1 } }, \
	{ MOD, XK_x,     ACTION##stack, {.i = -1 } },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define CMD(cmd) { .v = (const char*[]){ cmd, NULL } }
//#define COMMAND .v = (const char*[])

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_Escape, spawn,          CMD("slock") },
	{ MODKEY|SHIFT,                 XK_q,      quit,           {0} },
        
	{ MODKEY,                       XK_Return, spawn,          CMD(TERMINAL) },
	{ MODKEY,                       XK_d,      spawn,          SHCMD("dmenu_run -i -p 'Run:'") },
	//{ MODKEY,                       XK_d,      spawn,          { (const char*[]){"dmenu_run", "-i", "-p", "'Run:'", NULL} },
	{ MODKEY|SHIFT,                 XK_d,      spawn,          SHCMD("rofi -modi drun,run -show drun") },
	{ MODKEY,                       XK_b,      spawn,          CMD(BROWSER) },
	//{ MODKEY,                       XK_n,      spawn,          SHCMD(TERMINAL, "-e nnn") },
	{ MODKEY,                       XK_n,      spawn,          SHCMD("st -e nnn") },
	//{ MODKEY,                       XK_n,      spawn,          { (const char*[]){TERMINAL, "-e", "nnn", NULL} },
	{ MODKEY,                       XK_e,      spawn,          SHCMD("emacsclient -c -a 'emacs'") },
	{ MODKEY,                       XK_v,      spawn,          SHCMD("tabbed -c vimb -e") },
	{ MODKEY,                       XK_w,      spawn,          CMD("pcmanfm") },

	{ MODKEY,                       XK_m,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/music.sh") },
	{ MODKEY,                       XK_p,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/password.sh") },
	{ MODKEY|ALT,                   XK_o,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/soundout.sh") },
	{ MODKEY|ALT,                   XK_k,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/kill.sh") },
	{ MODKEY|ALT,                   XK_e,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/editcfg.sh") },
	{ MODKEY,                       XK_Insert, spawn,          SHCMD("~/.config/herbstluftwm/scripts/snippet.sh 1") },
	{ MODKEY|ALT,                   XK_b,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/snippet.sh 2") },
	{ MODKEY,                       XK_plus,   spawn,          SHCMD("~/.config/herbstluftwm/scripts/volume.sh 1") },
	{ MODKEY,                       XK_minus,  spawn,          SHCMD("~/.config/herbstluftwm/scripts/volume.sh 2") },
	{ MODKEY,                       XK_Print,  spawn,          SHCMD("~/.config/herbstluftwm/scripts/screenshot.sh 1") },
	{ MODKEY|ALT,                   XK_Print,  spawn,          SHCMD("~/.config/herbstluftwm/scripts/screenshot.sh 2") },
	{ MODKEY|SHIFT,                 XK_Print,  spawn,          SHCMD("~/.config/herbstluftwm/scripts/screenshot.sh 3") },
	{ MODKEY|CTRL,                  XK_Print,  spawn,          SHCMD("~/.config/herbstluftwm/scripts/screenshot.sh 4") },
	//{ MODKEY|SHIFT,                 XK_q,      spawn,          SHCMD("~/.config/herbstluftwm/scripts/wmquit.sh") },

	STACKKEYS(MODKEY,                          focus)
	STACKKEYS(MODKEY|SHIFT,                    push)
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY|SHIFT,                 XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|SHIFT,                 XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ALT,                   XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|ALT,                   XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|ALT,                   XK_0,      togglegaps,     {0} },
	{ MODKEY|ALT|SHIFT,             XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_g,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|SHIFT,                 XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|SHIFT,                 XK_period, tagmon,         {.i = +1 } },
        
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY|SHIFT,                 XK_f,      togglefloating, {0} },
        
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|SHIFT,                 XK_0,      tag,            {.ui = ~0 } },
        
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          CMD(TERMINAL) },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
