
proc sql;
   connect using tq84_ora;

/* Create a Oracle package for the functions declarations. */
   execute by tq84_ora (
      create or replace package tq84_pkg as

         function sum(a number  , b number  ) return number;
         function cat(a varchar2, b varchar2) return varchar2;

      end tq84_pkg;
   );

/* Create the respective Oracle package body with the
   function definitions. */
   execute by tq84_ora (
      create or replace package body tq84_pkg as

         function sum(a number  , b number  ) return number is begin
             return a + b;
         end sum;
         function cat(a varchar2, b varchar2) return varchar2 is begin
             return a || ' ' || b;
         end cat;

      end tq84_pkg;
   );

/* Call the functions using the dual table.
   Is this REALLY the way SAS wants us to do that???? */
   select sum, cat from connection to tq84_ora (
      select
          tq84_pkg.sum(     5 ,     37 ) as sum, 
          tq84_pkg.cat('hello', 'world') as cat
      from
          dual
   );

   disconnect from tq84_ora;
quit;
