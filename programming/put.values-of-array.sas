data _null_;

  array fib[10];

  fib[1] = 0;
  fib[2] = 1;

  do i = 3 to dim(fib);
    fib[i] = fib[i-2] + fib[i-1];
  end;

* put each element of array fib ;
  put (fib[*]) (=);

* put some selected elements of array ;
  put (fib4 fib7 fib8) (=);

run;
