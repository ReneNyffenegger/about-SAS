data work.cols_in_ds;
     attrib
        col_foo label='The foo'
        col_bar label='the bar'     length=$20.
        col_baz label='and the baz' length=$10.
     ;
     col_foo = 42;
     col_bar ='hello world';
     col_baz ='xyz';
     output;
run;


/* The columns can be shown with PROC PRINT */
proc print
     data = sashelp.vcolumn
     noobs;
     var    name type label /* format informat */;
     where  libname = 'WORK' and
            memname = 'COLS_IN_DS';
run;

/* The columns can also be shown with PROC SQL: */
proc sql;

/*   An easy way is to just describe the table: */
     describe table work.cols_in_ds;
/*
   create table WORK.COLS_IN_DS( bufsize=65536 )
     (
      col_foo num label='The foo',
      col_bar char(20) label='the bar',
      col_baz char(10) label='and the baz'
     );
*/

/*   Of course, we can also query sashelp.vcolumn
     for a 'real' tabular output. */
     select
       name  format $20.,
       type  format $4. ,
       label format $30.
     from
       sashelp.vcolumn
     where
       libname = 'WORK' and
       memname = 'COLS_IN_DS';
/*
                            Column
      Column Name           Type    Column Label
      ------------------------------------------------------------
      col_foo               num     The foo
      col_bar               char    the bar
      col_baz               char    and the baz
*/


/*   Instead of going to sashelp.vcolumn we
     can also query dicitionary.columns: */
     select
       name  format $20.,
       type  format $4. ,
       label format $30.
     from
       dictionary.columns
     where
       libname = 'WORK' and
       memname = 'COLS_IN_DS';
/*
                            Column
      Column Name           Type    Column Label
      ------------------------------------------------------------
      col_foo               num     The foo
      col_bar               char    the bar
      col_baz               char    and the baz
*/
quit;
