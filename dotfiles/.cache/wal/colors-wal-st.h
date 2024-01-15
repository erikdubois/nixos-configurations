const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0604", /* black   */
  [1] = "#41304D", /* red     */
  [2] = "#504C4C", /* green   */
  [3] = "#6C605D", /* yellow  */
  [4] = "#86563D", /* blue    */
  [5] = "#8F6D56", /* magenta */
  [6] = "#AC8C6F", /* cyan    */
  [7] = "#b0a2c5", /* white   */

  /* 8 bright colors */
  [8]  = "#7b7189",  /* black   */
  [9]  = "#41304D",  /* red     */
  [10] = "#504C4C", /* green   */
  [11] = "#6C605D", /* yellow  */
  [12] = "#86563D", /* blue    */
  [13] = "#8F6D56", /* magenta */
  [14] = "#AC8C6F", /* cyan    */
  [15] = "#b0a2c5", /* white   */

  /* special colors */
  [256] = "#0a0604", /* background */
  [257] = "#b0a2c5", /* foreground */
  [258] = "#b0a2c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
