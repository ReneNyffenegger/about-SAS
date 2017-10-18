
%macro tq84_locale (locale);
  options locale = &locale;

  %put %sysfunc(datetime(), nldatm.);
%mend  tq84_locale;

%tq84_locale(de_DE) /* 18. Oktober 2017 03.57 Uhr */
%tq84_locale(en_US) /* 18Oct2017:03:57:49         */
