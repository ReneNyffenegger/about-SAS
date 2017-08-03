%macro tq84_params (
   p1               ,
   p2               ,
   p3 =             ,
   p4 = default_four,
   p5 =             ,
   p6 = default_six
);

  %put &=p1;
  %put &=p2;
  %put &=p3;
  %put &=p4;
  %put &=p5;
  %put &=p6;

%mend tq84_params;

%tq84_params( p3=three, p2=two );
