data rnd;
  do i = 1 to 10;

    bernoulli         = rand('bern',  0.2           );
    beta              = rand('beta',  5  ,   0.2    );
    binomial          = rand('bino',  0.2,   4      );
    cauchy            = rand('cauc'                 );
    chi_square        = rand('chis', 42             );
    erlang            = rand('erla',  5             );
    exponential       = rand('expo'                 );
    f                 = rand('f'   ,  9  , 100      );
    gamma             = rand('gamm',  8.8           );
    geometric         = rand('geom',  0.1           );
    hypergeometric    = rand('hype',  9  ,   3   , 5);
    lognormal         = rand('logn'                 );
    negative_binomial = rand('negb',  0.5,   5      );
    normal            = rand('norm'                 );
    poisson           = rand('pois',  7.7           );
    t                 = rand('t'   ,  5             );
    tabled            = rand('tabl',  0.4,   0.3    );
    triangular        = rand('tria',  0.6           );
    uniform           = rand('unif'                 );
    weibull           = rand('weib',  0.4,   3.3    );


    output;
  end;

run;

proc print data=rnd;
run;
