data _null_;

  val = 4       ; put val pvalue6.3; /*  4.000 */
  val = 0.4     ; put val pvalue6.3; /*  0.400 */
  val = 0.04    ; put val pvalue6.3; /*  0.040 */
  val = 0.004   ; put val pvalue6.3; /*  0.004 */
  val = 0.0004  ; put val pvalue6.3; /*  <.001 */
  val = 0.00004 ; put val pvalue6.3; /*  <.001 */
  val = 44.00004; put val pvalue6.3; /* 44.000 */

run;
