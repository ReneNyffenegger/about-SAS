%macro tq84_opt(opt);
  %sysfunc(getoption(&opt))
%mend  tq84_opt;

%macro tq84_putOpt(opt);
  %put &opt=%tq84_opt(&opt);
%mend  tq84_putOpt;
