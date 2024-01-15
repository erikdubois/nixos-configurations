static const char norm_fg[] = "#98b3d7";
static const char norm_bg[] = "#050513";
static const char norm_border[] = "#6a7d96";

static const char sel_fg[] = "#98b3d7";
static const char sel_bg[] = "#0C349F";
static const char sel_border[] = "#98b3d7";

static const char urg_fg[] = "#98b3d7";
static const char urg_bg[] = "#0C358B";
static const char urg_border[] = "#0C358B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
