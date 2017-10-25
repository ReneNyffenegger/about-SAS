%let    some_var = foo;
%put    some_var = &some_var; /* some_var = foo */
%symdel some_var;
%put    some_var = &some_var; /* WARNING: Apparent symbolic reference SOME_VAR not resolved. */
%symdel some_var;             /* WARNING: Attempt to delete macro variable SOME_VAR failed. Variable not found. */
%symdel some_var /nowarn;
