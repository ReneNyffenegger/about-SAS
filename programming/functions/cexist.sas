data _null_;

   if cexist('sashelp.sasmacr')
   then put  'sashelp.sasmacr exists';
   else put  'sashelp.sasmacr does not exist';
/* sashelp.sasmacr exists                        */

   if cexist('sashelp.sasmacr.ts_create_dsn')
   then put  'sashelp.sasmacr.ts_create_dsn exists';
   else put  'sashelp.sasmacr.ts_create_dsn does not exist';
/* sashelp.sasmacr.ts_create_dsn does not exist  */

   if cexist('sashelp.sasmacr.ts_create_dsn.macro')
   then put  'sashelp.sasmacr.ts_create_dsn.macro exists';
   else put  'sashelp.sasmacr.ts_create_dsn.macro does not exist';
/* sashelp.sasmacr.ts_create_dsn.macro exists    */
 
   if cexist('foo.bar')
   then put  'foo.bar exists';
   else put  'foo.bar does not exist';
/* foo.bar does not exist                        */

run;
