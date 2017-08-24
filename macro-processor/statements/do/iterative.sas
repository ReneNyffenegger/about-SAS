%macro tq84_loop(f, t);
  %do i=&f %to &t;
    %put i= &i;
  %end;
%mend tq84_loop;

%tq84_loop(5, 20);
