proc sql;

  create table tab_one (
    col_one   char(10),
    col_three num     ,
    col_four  num     ,
    col_five  char(15),
    col_six   char( 8)
  );

  create table tab_two (
    col_one   char(10),
    col_two   num     ,
    col_four  char( 7),
    col_five  char(18),
    col_six   num
  );

quit;


%compareDatasetStructure(dataset_a = tab_one, dataset_b = tab_two);
