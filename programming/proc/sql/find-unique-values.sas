data tq84_data;

  length id      8
         foo  $ 10
         bar  $ 10
         baz  $ 10;

  input  id foo bar baz;

datalines;
1 one      xxx    abc
2 two      abc    def
3 three    abc    .
4 four     xxx    ghi
5 five     def    .
6 six      abc    jkl
7 seven    xxx    mno
8 eight    def    pqr
9 nine     abc    .
10 ten     xxx    stu
run;

proc sql;

  select
    ifc (uq_foo eq cnt, 'foo is unique', 'foo is not unique'),
    ifc (uq_bar eq cnt, 'bar is unique', 'bar is not unique'),
    ifc (uq_baz eq cnt, 'baz is unique', 'baz is not unique')
  from (
    select
      count(*)           as cnt,
      count(unique(foo)) as uq_foo,
      count(unique(bar)) as uq_bar,
      count(unique(baz)) as uq_baz
    from
      tq84_data
  );

quit;
