/*     Specify Oracle user, password and server: */
%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

proc sql;
/*
    Create the destination Oracle table with pass through.
*/
 
  connect to oracle as tq84_ora (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  execute (
    create table tq84_proc_dbload_test (
      num    number        primary key,
      txt_en varchar2(20)  not null   ,
      txt_de varchar2(20)  not null
    )
  ) by tq84_ora;

quit;

data tq84_data_source;
/*
     Create a data set with the source data:
*/

  length num       8
         txt_en $ 20
         txt_de $ 20;

   input num txt_en txt_de;

datalines;
1 one eins
2 two zwei
3 three drei
4 four vier
5 five fünf
run;

proc dbload
/*
     Transfer data from dataset into destination table.
*/
     data   = tq84_data_source
     dbms   = oracle
     append; /* Use append to insert into the table rather than to try to create one */
     
    
     user   = "&ora_user";
     orapw  = "&ora_password";
     path   = "&ora_server";
     table  = tq84_proc_dbload_test;
     commit = 100000;
     limit  = 0;

     load;
run;
