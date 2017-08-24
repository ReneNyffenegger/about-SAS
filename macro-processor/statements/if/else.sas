%macro tq84_if_then_else(val_one, val_two);

  %if &val_one gt &val_two
      %then %put "&val_one > &val_two";
      %else %put "&val_one <= &val_two";

%mend tq84_if_then_else;

%tq84_if_then_else(42, 10);
%tq84_if_then_else(42, 42);
%tq84_if_then_else(42, 99);
