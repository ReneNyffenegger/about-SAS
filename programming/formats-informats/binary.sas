data _null_;

  num =           1 ; put num binary8.; /* 00000001 */
  num =       4     ; put num binary8.; /* 00000100 */
  num =     8  +2+1 ; put num binary8.; /* 00001011 */
  num =  16+8  +2   ; put num binary8.; /* 00011010 */

run;
