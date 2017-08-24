%macro tq84_loop(f, t, b);

  %do i=&f %to &t %by &b;
    %put i= &i;
  %end;
  
%mend tq84_loop;

%tq84_loop(0, 100, 11);
