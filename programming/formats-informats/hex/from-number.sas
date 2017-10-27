data _null_;

  val =     0; put val hex4.; /* 0000 */
  val =     1; put val hex4.; /* 0001 */
  val =    16; put val hex4.; /* 0010 */
  val =   255; put val hex4.; /* 00FF */
  val =   256; put val hex4.; /* 0100 */
  val = 32767; put val hex4.; /* 7FFF */
  val = 32768; put val hex4.; /* 8000 */
  val = 65535; put val hex4.; /* FFFF */
  val = 65536; put val hex4.; /* 0000 */
  val = 65537; put val hex4.; /* 0001 */
  val =    -1; put val hex4.; /* FFFF */

run;
