%macro tq84_scopeTest_IF(param);

   %local var;
/* A value is assigned to a local variable in a macro: */
   %let   var = %eval(&param * &param);
   %put   a) var = &var;                  /* a) var = 64 */

   %if &var gt 50 %then %do;
   /*  The same variable is declared local again
       within an if statement. It DOES NOT create another
       variable, var is still the same variable that was
       already assigned outside the if statement: */
       %local var;
       %let var = %eval(&param * 2);
       %put b) var = &var;                /* b) var = 16 */
   %end;

/* This put statement prints the value that was assigned within
   the if statement, thus showing that var within the if statement
   refers to the same var as var outside the if statement: */
   %put c) var = &var;                    /* c) var = 16 */

%mend tq84_scopeTest_IF;

%tq84_scopeTest_IF(8)
