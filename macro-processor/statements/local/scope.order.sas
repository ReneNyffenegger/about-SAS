%macro tq84_scopeTest_ORDER(param);

  %put   var (inner 1) = &var;            /* var (inner 1) = 42 */
  %let   var = %eval(&param * &param);
  %put   var (inner 2) = &var;            /* var (inner 2) = 36 */
  %local var;
  %put   var (inner 3) = &var;            /* var (inner 3) =    */
  %let   var = %eval(&param * 2);
  %put   var (inner 4) = &var;            /* var (inner 4) = 12 */

%mend  tq84_scopeTest_ORDER;

%let var=42;
%put var (outer 1) = &var;                /* var (outer 1) = 42 */
%tq84_scopeTest_ORDER(6)
%put var (outer 2) = &var;                /* var (outer 2) = 36 */
