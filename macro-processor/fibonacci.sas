--
-- Recursively calling a macro.
--
%macro fibonacci(n);
  %if       &n eq 0 %then 1;
  %else %if &n eq 1 %then 1;
  %else %eval(%fibonacci(%eval(&n-1)) + %fibonacci(%eval(&n-2)));
%mend;

%macro put_fibonacci_numbers(n);

  %do i=1 %to &n;
      %put fibonacci number &i is %fibonacci(&i);
  %end;

%mend put_fibonacci_numbers;


%put_fibonacci_numbers(10);
