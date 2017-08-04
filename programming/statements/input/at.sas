/*

  @n are column pointers which say: move to column n.

*/

data tq84_ts; 

  input
    @1  num_name  $ 9.
    @13 num_value   2.0
    @18 num_roman $
  ;

datalines;
one      abc 1mnoI
three    def 3pqrIII
nine     ghi 9stuIX
forty-twojkl42vwxXLII
;

proc print data=tq84_ts;
run;
