/*
   The %eval macro function can only evaluate integer
   arithmetic or logical expressions
*/

%put 39 + 3 = %eval( 39 + 3 );
%put 45 - 3 = %eval( 45 - 3 );

%let  one_plus_one = 1+1;
%put &one_plus_one; /* 1+1 */

%let two = %eval(&one_plus_one);
%put &two; /* 2 */

/* Eval can not handle floating point numbers.
   The following line causes
     ERROR: A character operand was found in the
     %EVAL function or %IF condition where a
     numeric operand is required.
*/
%put 45.1 - 3.1 = %eval( 45.1 - 3.1 );

/* %sysevalf however CAN evaluate floating point
   numbers: */
%put 45.1 - 3.1 = %sysevalf( 45.1 - 3.1 );  /* 45.1 - 3.1 = 42 */
%put 45   - 3   = %sysevalf( 45   - 3   );  /* 45   - 3   = 42 */
