proc fcmp outlib=work.funcs.tq84;
  function tq84_max(a, b);
    if a > b then return (a);
    return (b);
  endsub;
run;


data _null_;

  v =    7;
  w =    3;
  x =   42;
  y  = 999;

  max_vw = tq84_max(v, w);
  max_xy = tq84_max(x, y);

  put max_vw=;
  put max_xy=;
run;
