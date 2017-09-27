/* %sysfunc (and %qsysfunc) can execute most SAS functions */

%let text=foo bar baz;
%let sub_4_3=%sysfunc(substr(&text, 5, 3));
%put &sub_4_3;

%put %sysfunc(date(), worddate.);
