const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#050513", /* black   */
  [1] = "#0C358B", /* red     */
  [2] = "#0C349F", /* green   */
  [3] = "#0E4794", /* yellow  */
  [4] = "#0E52AC", /* blue    */
  [5] = "#1E63B1", /* magenta */
  [6] = "#1270C9", /* cyan    */
  [7] = "#98b3d7", /* white   */

  /* 8 bright colors */
  [8]  = "#6a7d96",  /* black   */
  [9]  = "#0C358B",  /* red     */
  [10] = "#0C349F", /* green   */
  [11] = "#0E4794", /* yellow  */
  [12] = "#0E52AC", /* blue    */
  [13] = "#1E63B1", /* magenta */
  [14] = "#1270C9", /* cyan    */
  [15] = "#98b3d7", /* white   */

  /* special colors */
  [256] = "#050513", /* background */
  [257] = "#98b3d7", /* foreground */
  [258] = "#98b3d7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
