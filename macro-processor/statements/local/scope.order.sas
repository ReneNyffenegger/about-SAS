%macro tq84_scopeTest_ORDER(param);
/* The macro variable var is not yet local, the put
   prints the value of the global variable. */
   %put   var (inner 1) = &var;            /* var (inner 1) = 42 */
   
/* Similarly, the assignment changes the value of the
   global variable: */
   %let   var = %eval(&param * &param);
   %put   var (inner 2) = &var;            /* var (inner 2) = 36 */
   
/* Another variable by the name var is introduced. It is local to
   the macro: */
   %local var;
   
/* Since the variable is not initialized, it prints an empty value: */
   %put   var (inner 3) = &var;            /* var (inner 3) =    */
   
/* The assignment changes the local variable only, the global variable
   is not affected: */
   %let   var = %eval(&param * 2);
   %put   var (inner 4) = &var;            /* var (inner 4) = 12 */

%mend  tq84_scopeTest_ORDER;

%let var=42;
%put var (outer 1) = &var;                /* var (outer 1) = 42 */
%tq84_scopeTest_ORDER(6)

/* This put prints the value as was changed to in the macro
   in the assignment before the %local statement had effect: */
%put var (outer 2) = &var;                /* var (outer 2) = 36 */
