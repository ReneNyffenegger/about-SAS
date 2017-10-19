%macro tq84_if;

  %if 39 + 3 = 42
  %then %put indeed, 39 + 3 is 42;
  %else %put surprisingly, 39 + 3 is not 42;


  /* The following %if statement does not work; it
     will cause the following error message:
       ERROR: A character operand was found in the %EVAL
              function or %IF condition where a numeric
              operand is required.
              The condition was: 
                  38.9 + 3.1 = 42 
       ERROR: The macro TQ84_IF will stop executing.*/

  %if 38.9 + 3.1 = 42
  %then %put indeed, 38.9 + 3.1 is 42;
  %else %put surprisingly, 38.9 + 3.1 is not 42;

%mend tq84_if;
