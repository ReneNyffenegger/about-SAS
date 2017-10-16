libname tq84_lib "p:\ath\to\a\directory";


proc sql;
  create table tq84_lib.tab_parent (
    id           num,
    col_null     char(10),
    col_not_null char(10)  not null,
    constraint tab_parent_pk primary key(id)
  );

  create table tq84_lib.tab_child (
    id_parent   num,
    col_foo     num,
    col_bar     char(10)  check (col_bar in ('abc', 'def', 'ghi')),
    col_baz     char(10),
    constraint  tab_child_fk foreign key(id_parent) references tq84_lib.tab_parent,
    constraint  tab_child_pk primary key(id_parent, col_foo),
    constraint  tab_child_uq unique     (col_bar, col_baz)
  );
quit;


proc sql;
  select
    con.table_name,
    con.constraint_name,
    con.constraint_type,
    con.is_deferrable,
    con.initially_deferred
  from
   dictionary.table_constraints con
  where
    con.table_catalog = 'TQ84_LIB';
quit;


proc sql;
  select 
    table_name,
    column_name,
    constraint_name
  from
    dictionary.constraint_column_usage
  where 
    table_catalog = 'TQ84_LIB';
quit;


proc sql;
  describe table constraints tq84_lib.tab_parent;
  describe table constraints tq84_lib.tab_child;
quit;


/* clean up: */
proc sql;
  alter table tq84_lib.tab_child drop constraint tab_child_fk;
  drop  table tq84_lib.tab_child;
  drop  table tq84_lib.tab_parent;
quit;
