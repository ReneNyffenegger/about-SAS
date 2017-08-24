%macro tq84_if(val_one, val_two);

  %if &val_one gt &val_two %then %put "&val_one > &val_two";

%mend tq84_if;

%tq84_if(42, 10);
