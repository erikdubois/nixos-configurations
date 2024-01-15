/* See LICENSE file for copyright and license details. */

#define XF86MonBrightnessDown 0x1008ff03
#define XF86MonBrightnessUp 0x1008ff02

/* appearance */
static const unsigned int borderpx          = 1;        /* border pixel of windows */
static const unsigned int default_border    = 0;  // to switch back to default border after dynamic border resizing via keybinds
static const unsigned int snap              = 32;       /* snap pixel */
static const unsigned int gappih            = 0;       /* horiz inner gap between windows */
static const unsigned int gappiv            = 0;       /* vert inner gap between windows */
static const unsigned int gappoh            = 8;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov            = 8;       /* vert outer gap between windows and screen edge */
static       int smartgaps                  = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning    = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing    = 2;   /* systray spacing */
static const int systraypinningfailfirst    = 1;   /* 1: if pinning fails,display systray on the 1st monitor,False: display systray on last monitor*/
static const int showsystray                = 1;     /* 0 means no systray */
static const int showbar                    = 0;        /* 0 means no bar */
enum showtab_modes { showtab_never, showtab_auto, showtab_nmodes, showtab_always };
static const int showtab                    = showtab_auto;
static const int toptab                     = 0;
static const int topbar                     = 1;        /* 0 means bottom bar */
static const int horizpadbar                = 5;
static const int vertpadbar                 = 11;
static const int vertpadtab                 = 33;
static const int horizpadtabi               = 15;
static const int horizpadtabo               = 15;
static const int scalepreview               = 4;
static       int tag_preview                = 1;        /* 1 means enable, 0 is off */

static const char *fonts[]                  = { "FiraCode Nerd Font:style:medium:size=12","Material Design Icons-Regular:size=12" };
static const char dmenufont[]               = "FiraCode:size=12";
static const int colorfultag                = 1;  /* 0 means use SchemeSel for selected non vacant tag */

// theme
#include "themes/nord.h"
#include <X11/XF86keysym.h>


static const char *colors[][3] = {
  /*               fg         bg         border   */
  [SchemeNorm]       = { gray3, black, gray2 },
  [SchemeSel]        = { gray4, blue,  green },
  [TabSel]           = { blue,  gray2, black },
  [TabNorm]          = { gray3, black, black },
  [SchemeTag]        = { gray3, black, black },
  [SchemeTag1]       = { red,   black, black },
  [SchemeTag2]       = { yellow,black, black },
  [SchemeTag3]       = { blue,  black, black },
  [SchemeTag4]       = { green, black, black },
  [SchemeLayout]     = { green, black, black },
  [SchemeBtnPrev]    = { green, black, black },
  [SchemeBtnNext]    = { yellow,black, black },
  [SchemeBtnClose]   = { red, black, black },
};

/* tagging */
static char *tags[] = {" 1 ", " 2 ", " 3 ", " 4 ", " 5 "};

static const int tagschemes[] = { SchemeTag1, SchemeTag2, SchemeTag3,SchemeTag4 };

static const unsigned int ulinepad	    = 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		        = 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
  /* xprop(1):
   *	WM_CLASS(STRING) = instance, class
   *	WM_NAME(STRING) = title
   */
  /* class      instance    title       tags mask     iscentered   isfloating   monitor */
  { "Gimp",     NULL,       NULL,       0,            0,           1,           -1 },
  { "Firefox",  NULL,       NULL,       1 << 8,       0,           0,           -1 },
  { "eww",      NULL,       NULL,       0,            0,           1,           -1 },
};

/* layout(s) */
static const float mfact        = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "functions.h"

static const Layout layouts[] = {
  /* symbol     arrange function */
  { "[M]",      monocle },
  { "H[]",      deck },
  { "|M|",      centeredmaster },
  { "===",      bstackhoriz }, // start format
  { "[]=",      tile },
  { "><>",      NULL },    /* no layout function means floating behavior */

  //{ "TTT",      bstack },
  //{ "HHH",      grid },
  //{ "###",      nrowgrid },
  //{ "---",      horizgrid },
  //{ "[@]",      spiral },
  //{ "[\\]",     dwindle },
  //{ ">M>",      centeredfloatingmaster },
  //{ "|+|",      tatami },
  //{ ":::",      gaplessgrid },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHELL(cmd) { .v = (const char*[]){ "fish","-c", cmd, NULL } }
#define RUN(cmd) { .v = (const char*[]){ cmd, NULL } }
#define TERM(cmd) { .v = (const char*[]){ "kitty", "-e", "fish","-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", NULL }; //main launcher
//just for reminder that things used to be done this way + dmenucmd is used in dwm.c ,
//will have to change two places everytime i change launcher so better keep this way

static Key keys[] = {
  //TagKeys
  TAGKEYS(                           XK_1,                                      0)
  TAGKEYS(                           XK_2,                                      1)
  TAGKEYS(                           XK_3,                                      2)
  TAGKEYS(                           XK_4,                                      3)
  TAGKEYS(                           XK_5,                                      4)

  /* modifier                        key                       function        argument */
  { Mod1Mask,                        XK_Return,                spawn,          SHELL("cdev") },
  { MODKEY,                          XK_e,                     spawn,          TERM("e ~/.config/nixpkgs/home.nix") },
  { MODKEY,                          XK_m,                     spawn,          SHELL("play_classical") },
  { MODKEY,                          XK_c,                     spawn,          SHELL("rofi -show run") },
  { MODKEY,                          XK_s,                     spawn,          TERM("fish -c (dwmkeys | xargs |awk -F '[()]' '{print $2}')") },
  { MODKEY,                          XK_w,                     spawn,          SHELL("walli") },
  { MODKEY|Mod1Mask,                 XK_b,                     spawn,          SHELL("firefox") },
  { MODKEY|ShiftMask,                XK_v,                     spawn,          SHELL("$BROWSER") },
  { MODKEY|Mod1Mask,                 XK_d,                     spawn,          SHELL("pkill dwmblocks;dwmblocks &") },
  { MODKEY|Mod1Mask,                 XK_r,                     spawn,          SHELL("v $DOCUMENTS/routine.pdf") },
  { MODKEY|ControlMask,              XK_s,                     spawn,          SHELL("v $DOCUMENTS/Syllabus.pdf") },
  { MODKEY|Mod1Mask,                 XK_s,                     spawn,          TERM("v $DOCUMENTS/resources.md") },
  { MODKEY|ShiftMask,                XK_m,                     spawn,          TERM("read -P 'Enter man Query: ' query;man (echo $query)") },
  { MODKEY|Mod1Mask,                 XK_h,                     spawn,          TERM("htop") },
  { MODKEY|Mod1Mask,                 XK_i,                     spawn,          SHELL("edwm") },
  { Mod1Mask,                        XK_p,                     spawn,          SHELL("picomSwitch") },
  { MODKEY,                          XK_Return,                spawn,          TERM("nnn -cndeHFnQrux") },
  { MODKEY|ShiftMask,                XK_s,                     spawn,          TERM("connect_me") },
  { Mod1Mask,                        XK_s,                     spawn,          SHELL("feh --bg-fill (sxiv -o -t ~/Screenshots/)") },
  { Mod1Mask,                        XK_w,                     spawn,          SHELL("feh --bg-fill (sxiv -o -t $WALLPAPERS)") },
  { MODKEY|Mod1Mask,                 XK_k,                     spawn,          SHELL("pkill screenkey") },
  { MODKEY|Mod1Mask,                 XK_a,                     spawn,          SHELL("screenkey --no-systray -t 0.4 --opacity 0.0") },
  { MODKEY|Mod1Mask,                 XK_y,                     spawn,          TERM("ytfzf -t -l --sort") },
  { MODKEY|Mod1Mask,                 XK_t,                     spawn,          SHELL("telegram-desktop") },
  { MODKEY|Mod1Mask,                 XK_e,                     spawn,          SHELL("headset") },
  { MODKEY|ShiftMask,                XK_w,                     spawn,          SHELL("feh --bg-fill --randomize $WALLPAPERS") },
  { MODKEY|ShiftMask,                XK_n,                     spawn,          SHELL("nmcli con up CoudBe") },
  { MODKEY|ShiftMask,                XK_b,                     spawn,          SHELL("bluetooth on;bluetoothctl connect (btid)") },
  { MODKEY|ControlMask,              XK_r,                     spawn,          SHELL("reboot") },
  { MODKEY|ControlMask,              XK_p,                     spawn,          SHELL("poweroff") },
  { MODKEY|ControlMask,              XK_h,                     spawn,          SHELL("betterlockscreen -l; systemctl hybrid-sleep")},
  { MODKEY|ControlMask,              XK_h,                     spawn,          SHELL('betterlockscreen -l blur --time-format "%I:%M %p"') },
  { MODKEY,                          XK_l,                     spawn,          SHELL("betterlockscreen -l") },
  { MODKEY|Mod1Mask,                 XK_Return,                spawn,          SHELL("$TERM") },
  { MODKEY|ShiftMask,                XK_n,                     spawn,          RUN("nautilus") },
  { MODKEY|ShiftMask,                XK_Return,                spawn,          RUN("packages") },
  { MODKEY|ControlMask,              XK_u,                     spawn,          SHELL("maim | xclip -selection clipboard -t image/png")},
  { MODKEY,                          XK_u,                     spawn,          SHELL("maim --select | xclip -selection clipboard -t image/png")},
  //Screenshot types
  { 0,                               XK_Print,                 spawn,          SHELL("flameshot full -p ~/Screenshots/") },
  { MODKEY,                          XK_Print,                 spawn,          SHELL("flameshot gui -p ~/Screenshots/") },
  { MODKEY|ShiftMask,                XK_Print,                 spawn,          SHELL("flameshot gui -c") },

  //Gromit-mpx: write on screen
  { MODKEY,                          XK_x,                     spawn,          SHELL("pkill gromit-mpx;or gromit-mpx -a") },
  { MODKEY,                          XK_y,                     spawn,          SHELL("pidof gromit-mpx && gromit-mpx -y") },
  { MODKEY,                          XK_z,                     spawn,          SHELL("pidof gromit-mpx && gromit-mpx -z") },
  { MODKEY,                          XK_v,                     spawn,          SHELL("pidof gromit-mpx && gromit-mpx -v") },

  //Audio Management
  { 0,                               XF86XK_AudioLowerVolume,  spawn,          SHELL("amixer set Master 10%- && pkill -RTMIN+11 dwmblocks") },
  { 0,                               XF86XK_AudioMute,         spawn,          SHELL("amixer set Master toggle && pkill -RTMIN+11 dwmblocks") },
  { 0,                               XF86XK_AudioRaiseVolume,  spawn,          SHELL("amixer set Master 10%+ && pkill -RTMIN+11 dwmblocks") },

  //Brightness Management
  { 0, 								 XF86MonBrightnessDown,    spawn,         SHELL("light -U 10 && pkill -RTMIN+10 dwmblocks") },
  { 0, 								 XF86MonBrightnessUp,      spawn,         SHELL("light -A 10 && pkill -RTMIN+10 dwmblocks") },

  { MODKEY,                          XK_b,                     togglebar,      {0} },
  { MODKEY|ControlMask,              XK_w,                     tabmode,        { -1 } },
  { MODKEY,                          XK_Tab,                   focusstack,     {.i = +1 } },
  { MODKEY,                          XK_k,                     focusstack,     {.i = -1 } },
  { MODKEY,                          XK_i,                     incnmaster,     {.i = +1 } },
  { MODKEY,                          XK_d,                     incnmaster,     {.i = -1 } },
  { MODKEY,                          XK_h,                     setmfact,       {.f = -0.05} },
  { MODKEY,                          XK_l,                     setmfact,       {.f = +0.05} },
  { MODKEY|ShiftMask,                XK_h,                     setcfact,       {.f = +0.25} },
  { MODKEY|ShiftMask,                XK_l,                     setcfact,       {.f = -0.25} },
  { MODKEY|ShiftMask,                XK_o,                     setcfact,       {.f =  0.00} },
  { MODKEY|ShiftMask,                XK_j,                     movestack,      {.i = +1 } },
  { MODKEY|ShiftMask,                XK_k,                     movestack,      {.i = -1 } },
  //{ MODKEY,                       XK_Return, zoom,           {0} },
  //{ MODKEY,                       XK_Tab,    view,           {0} },

  // overall gaps
  { MODKEY|ControlMask,              XK_i,                     incrgaps,       {.i = +1 } },
  { MODKEY|ControlMask,              XK_d,                     incrgaps,       {.i = -1 } },

  // inner gaps
  { MODKEY|ShiftMask,                XK_i,                     incrigaps,      {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_i,                     incrigaps,      {.i = -1 } },

  // outer gaps
  { MODKEY|ControlMask,              XK_o,                     incrogaps,      {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_o,                     incrogaps,      {.i = -1 } },

  { MODKEY|ControlMask,              XK_6,                     incrihgaps,     {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_6,                     incrihgaps,     {.i = -1 } },
  { MODKEY|ControlMask,              XK_7,                     incrivgaps,     {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_7,                     incrivgaps,     {.i = -1 } },
  { MODKEY|ControlMask,              XK_8,                     incrohgaps,     {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_8,                     incrohgaps,     {.i = -1 } },
  { MODKEY|ControlMask,              XK_9,                     incrovgaps,     {.i = +1 } },
  { MODKEY|ControlMask|ShiftMask,    XK_9,                     incrovgaps,     {.i = -1 } },

  { MODKEY|ControlMask,              XK_t,                     togglegaps,     {0} },
  { MODKEY|ControlMask|ShiftMask,    XK_d,                     defaultgaps,    {0} },

  { MODKEY|ShiftMask,                XK_c,                     killclient,     {0} },
  { MODKEY,                          XK_space,                 cyclelayout,    {.i = -1 } },
  { MODKEY|ShiftMask,                XK_space,                 cyclelayout,    {.i = +1 } },
  { MODKEY|ShiftMask,                XK_f,                     togglefloating, {0} },
  { MODKEY,                          XK_f,                     togglefullscr,  {0} },
  { MODKEY,                          XK_0,                     view,           {.ui = ~0 } },
  { MODKEY|ShiftMask,                XK_0,                     tag,            {.ui = ~0 } },
  { MODKEY,                          XK_comma,                 focusmon,       {.i = -1 } },
  { MODKEY,                          XK_period,                focusmon,       {.i = +1 } },
  { MODKEY|ShiftMask,                XK_comma,                 tagmon,         {.i = -1 } },
  { MODKEY|ShiftMask,                XK_period,                tagmon,         {.i = +1 } },
  { MODKEY|ShiftMask,                XK_minus,                 setborderpx,    {.i = -1 } },
  { MODKEY|ShiftMask,                XK_p,                     setborderpx,    {.i = +1 } },

  { MODKEY|ShiftMask,                XK_q,                     quit,           {0} },
  { MODKEY|ShiftMask,                XK_r,                     quit,           {1} },
  { MODKEY,                          XK_h,                     hidewin,        {0} },
  { MODKEY|ShiftMask,                XK_h,                     restorewin,     {0} },
  //{ MODKEY,                      	  XK_t,                    setlayout,      {.v = &layouts[0]} },
  //{ MODKEY|ShiftMask,            	  XK_f,                    setlayout,      {.v = &layouts[1]} },
  //{ MODKEY,                      	  XK_m,                    setlayout,      {.v = &layouts[2]} },
  //{ MODKEY|ControlMask,          	  XK_g,                    setlayout,      {.v = &layouts[10]} },
  //{ MODKEY|ControlMask|ShiftMask,	  XK_t,                    setlayout,      {.v = &layouts[13]} },
  //{ MODKEY|ShiftMask,               XK_w, 	               setborderpx,    {.i = default_border } },
  //{ MODKEY,                      	  XK_space,                setlayout,      {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click                           event mask                button          function        argument */
  { ClkLtSymbol,                     0,                        Button1,        setlayout,      {0} },
  { ClkLtSymbol,                     0,                        Button3,        setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,                     0,                        Button2,        zoom,           {0} },
  //{ ClkStatusText,                   0,                        Button2,        spawn,          {.v = term } },

  /* Keep movemouse? */
  /* { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} }, */

  /* placemouse options, choose which feels more natural:
   *    0 - tiled position is relative to mouse cursor
   *    1 - tiled postiion is relative to window center
   *    2 - mouse pointer warps to window center
   *
   * The moveorplace uses movemouse or placemouse depending on the floating state
   * of the selected client. Set up individual keybindings for the two if you want
   * to control these separately (i.e. to retain the feature to move a tiled window
   * into a floating position).
   */
  { ClkClientWin,                    MODKEY,                   Button1,        moveorplace,    {.i = 0} },
  { ClkClientWin,                    MODKEY,                   Button2,        togglefloating, {0} },
  { ClkClientWin,                    MODKEY,                   Button3,        resizemouse,    {0} },
  { ClkClientWin,                    ControlMask,              Button1,        dragmfact,      {0} },
  { ClkClientWin,                    ControlMask,              Button3,        dragcfact,      {0} },
  { ClkTagBar,                       0,                        Button1,        view,           {0} },
  { ClkTagBar,                       0,                        Button3,        toggleview,     {0} },
  { ClkTagBar,                       MODKEY,                   Button1,        tag,            {0} },
  { ClkTagBar,                       MODKEY,                   Button3,        toggletag,      {0} },
  { ClkTabBar,                       0,                        Button1,        focuswin,       {0} },
  { ClkTabBar,                       0,                        Button1,        focuswin,       {0} },
  { ClkTabPrev,                      0,                        Button1,        movestack,      { .i = -1 } },
  { ClkTabNext,                      0,                        Button1,        movestack,      { .i = +1 } },
  { ClkTabClose,                     0,                        Button1,        killclient,     {0} },
};



