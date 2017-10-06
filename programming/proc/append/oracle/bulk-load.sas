/* Create a data set that will be "bulk loaded" to Oracle.
   Of course, with one record, bulk loading does not really
   make much of sense... */
data tq84_dat_src;

     format d  date7.;
     format dt datetime16.;

     num =  1; 
     d   = '27sep17'd;
     dt  = '13aug17 01:23:45'dt;

     output;
run;


/* Connect to Oracle: */
%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;

/* Create the table into which the data is loaded: */
proc sql;
  connect using tq84_ora;

  execute (
     create table tq84_dat_dest (
        num  number,
        d    date,
        dt   date
     )
  ) by tq84_ora;
quit;



%let work_path=%sysfunc(pathname(work));

/* Use the bulkload option to bulk load the data. */
proc append
     base = tq84_ora.tq84_dat_dest
    (bulkload                = yes
     bl_recoverable          = no
     bl_options              = 'errors=0, parallel=true, rows=1000000'
     bl_delete_only_datafile =  yes
     bl_datafile             = "&work_path/bl.dat"
     bl_control              = "&work_path/bl.ctl"
     bl_log                  = "&work_path/bl.log" 
     bl_badfile              = "&work_path/bl.bad" 
     bl_discardfile          = "&work_path/bl.dsc"
     sasdatefmt =(d  = 'date.'      /* Use sasdatefmt to inform about the source date format */
                  dt = 'datetime.'
                 )
    )
    data = tq84_dat_src;
run;


/* Check if the record was loaded. Especially make sure
   that the dates were loaded correctly: */
proc sql;
   connect using tq84_ora;

   select * from connection to tq84_ora (
      select
        num,
        to_char(d , 'dd.mm.yyyy hh24:mi:ss') d,
        to_char(dt, 'dd.mm.yyyy hh24:mi:ss') dt
      from
        tq84_dat_dest
   );

   disconnect from tq84_ora;
quit;

/* Finally clean up on Oracle's side: */
proc sql;
  connect using tq84_ora;

  execute ( drop table tq84_dat_dest purge ) by tq84_ora;
quit;
