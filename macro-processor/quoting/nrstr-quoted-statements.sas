/* %nrstr allows to quote macro statements: */
%let quotedStatements=%nrstr(
  %put macroVarOne = &macroVarOne;
  %put macroVarTwo = &macroVarTwo;
);

/* &quotedStatements now contains the quoted statements: */
%put &quotedStatements; /*  %put macroVarOne = &macroVarOne;   %put macroVarTwo = &macroVarTwo; */

/* Assign some values to the macro variables referenced in
   the quoted statements: */
%let macroVarOne = foo;
%let macroVarTwo = baz;

/* With unquote, the statements will be executed: */
%unquote(&quotedStatements)
/*
macroVarOne = foo
macroVarTwo = baz
*/
