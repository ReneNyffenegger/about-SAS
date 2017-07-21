%let text=foo bar baz;
%let sub_4_3=%sysfunc(substr(&text, 5, 3));
%put &sub_4_3;
