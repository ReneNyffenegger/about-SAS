data tq84;
  input foo bar $ baz $;
datalines;
1 one eins
4 four vier
2 two zwei
9 nine neun
;


proc print data=tq84;
/* var - Print columns foo and baz only: */
  var foo baz;
run;
