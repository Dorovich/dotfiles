/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]        = "Mononoki Nerd Font:size=12";
static const char* normbgcolor  = "#151515";
static const char* normfgcolor  = "#abb2bf";
static const char* selbgcolor   = "#d19a66";
static const char* selfgcolor   = "#151515";
static const char* urgbgcolor   = "#111111";
static const char* urgfgcolor   = "#cc0000";
static const char before[]      = "<";
static const char after[]       = ">";
static const char titletrim[]   = "...";
static const int  tabwidth      = 200;
static const Bool foreground    = True;
static       Bool urgentswitch  = False;

/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = 0;
static Bool npisrelative  = False;

#define SETPROP(p) { \
        .v = (char *[]){ "/bin/sh", "-c", \
                "prop=\"`xwininfo -children -id $1 | grep '^     0x' |" \
                "sed -e's@^ *\\(0x[0-9a-f]*\\) \"\\([^\"]*\\)\".*@\\1 \\2@' |" \
                "xargs -0 printf %b | dmenu -l 10 -w $1`\" &&" \
                "xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
                p, winid, NULL \
        } \
}

/* Keybinding anything to CONTROL+SHIFT should be avoided. */
/* CONTROL+SHIFT is used extensively in the surf browser. */
/* Use CONTROL+ALT instead! */

#define ALT Mod1Mask
#define CONTROL ControlMask
static Key keys[] = {
	/* modifier             key        function     argument */
	{ ALT|CONTROL,          XK_Return, focusonce,   { 0 } },
	{ ALT|CONTROL,          XK_Return, spawn,       { 0 } },

	{ ALT|CONTROL,          XK_l,      rotate,      { .i = +1 } },
	{ ALT|CONTROL,          XK_h,      rotate,      { .i = -1 } },
	{ ALT|CONTROL,          XK_j,      movetab,     { .i = -1 } },
	{ ALT|CONTROL,          XK_k,      movetab,     { .i = +1 } },
	{ ALT,                  XK_Tab,    rotate,      { .i = 0 } },

	{ ALT,                  XK_grave,  spawn,       SETPROP("_TABBED_SELECT_TAB") },
	{ ALT,                  XK_1,      move,        { .i = 0 } },
	{ ALT,                  XK_2,      move,        { .i = 1 } },
	{ ALT,                  XK_3,      move,        { .i = 2 } },
	{ ALT,                  XK_4,      move,        { .i = 3 } },
	{ ALT,                  XK_5,      move,        { .i = 4 } },
	{ ALT,                  XK_6,      move,        { .i = 5 } },
	{ ALT,                  XK_7,      move,        { .i = 6 } },
	{ ALT,                  XK_8,      move,        { .i = 7 } },
	{ ALT,                  XK_9,      move,        { .i = 8 } },
	{ ALT,                  XK_0,      move,        { .i = 9 } },

	{ ALT|CONTROL,          XK_q,      killclient,  { 0 } },

	{ ALT,                  XK_u,      focusurgent, { 0 } },
	{ ALT|CONTROL,          XK_u,      toggle,      { .v = (void*) &urgentswitch } },

	{ 0,                    XK_F11,    fullscreen,  { 0 } },

	{ CONTROL,              XK_Alt_L,     showbar,    { .i = 1 } },
	{ ALT,                  XK_Control_L, showbar,    { .i = 1 } },
	{ ALT,                  XK_period,    showbar,    { .i = 1 } },
	{ ALT,                  XK_comma,     showbar,    { .i = 0 } },
};

static Key keyreleases[] = {
	/* modifier             key           function  argument */
	{ ALT|CONTROL,          XK_Alt_L,     showbar,  { .i = 0 } },
	{ ALT|CONTROL,          XK_Control_L, showbar,  { .i = 0 } },
};
