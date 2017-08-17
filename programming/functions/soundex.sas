proc sql;
  select
    a.name          as name_a,
    b.name          as name_b,
    soundex(a.name) as name_soundex
  from
    sashelp.class a join
    sashelp.class b on soundex(a.name) = soundex(b.name)
  where
    a.name gt b.name;
quit;
