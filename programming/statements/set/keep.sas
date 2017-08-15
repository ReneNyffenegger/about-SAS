data tq84_in;
  input foo bar $ baz $;
datalines;
1 one eins
4 four vier
2 two zwei
9 nine neun
;


data tq84_out;
  set tq84_in(keep=foo baz);
run;

proc print data=tq84_out;
run;
