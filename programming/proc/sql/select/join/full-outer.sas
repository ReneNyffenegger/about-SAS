proc sql;
  
  create table a (id num, txt char(10));
  create table b (id num, txt char(10));

  insert into a values (1, 'one' );
  insert into a values (2, 'two' );
  insert into a values (4, 'four');

  insert into b values (2, 'II'  );
  insert into b values (3, 'III' );
  insert into b values (5, 'V'   );

  select
    coalesce(a.id, b.id) as id,
    a.txt,
    b.txt
  from
    a full outer join
    b on a.id = b.id;

quit;
