static const char norm_fg[] = "#b0a2c5";
static const char norm_bg[] = "#0a0604";
static const char norm_border[] = "#7b7189";

static const char sel_fg[] = "#b0a2c5";
static const char sel_bg[] = "#504C4C";
static const char sel_border[] = "#b0a2c5";

static const char urg_fg[] = "#b0a2c5";
static const char urg_bg[] = "#41304D";
static const char urg_border[] = "#41304D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
