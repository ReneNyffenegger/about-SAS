proc fcmp outlib=work.funcs.tq84;
  function tq84_sum(s[*]) varargs;
    sum_ = 0;
    do i = 1 to dim(s);
       sum_ = sum_ + s[i];
    end;
    return(sum_);
  endsub;

run;

data _null_;

  array ac[3] a b c;
  array dh[5] d e f g h;

  a = 1;
  b = 2;
  c = 3;
  d = 4;
  e = 5;
  f = 6;
  g = 7;
  h = 8;

  sum_ac = tq84_sum(ac);
  sum_dh = tq84_sum(dh);

  put sum_ac=;
  put sum_dh=;
run;
