proc sql;
  select
    min(age),
    max(age)
  into
    :minAge,
    :maxAge
  from
     sashelp.class;
run;

%put Min age is &minAge, max age is &maxAge;
