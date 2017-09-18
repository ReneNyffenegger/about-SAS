/*   Create a parent-child relationship between two tables
     using a primary and a foreign key: */
proc sql;
  
  create table tq84_parent (
     id   num,
     val char(25),
  /* ----------------------------------- */
     constraint tq84_pk primary key (id)
  );

  create table tq84_child (
     id_parent num,
     val       char(25),
  /* ----------------------------------- */
     constraint tq84_fk foreign key (id_parent) references tq84_parent
  );

quit;

/* SAS does not allow to drop the child of a foreign key
   relation ship!
   The following drop statement results in a
      ERROR: A rename/delete/replace attempt
             is not allowed for a data set
             involved in a referential integrity
             constraint. 
*/       
proc sql;
   drop table tq84_child;
quit;

/* So, the foreign key must explicitely be dropped before the
   child table can be dropped:
*/
proc sql;
  alter table tq84_child drop foreign key tq84_fk;

  drop table tq84_child;
quit;
