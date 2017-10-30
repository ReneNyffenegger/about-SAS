libname lib_one "p:\ath\to\a\directory";

/* Create three data sets in lib_one library: */
data lib_one.dataset_a;
  x = 'eggs';
run;

data lib_one.dataset_b;
  y = 'why';
run;

data lib_one.dataset_c;
  z = 'almost c';
run;

/* List files in library lib_one: */
proc datasets
     lib=lib_one;
run;
