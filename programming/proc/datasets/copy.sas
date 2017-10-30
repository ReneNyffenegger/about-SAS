%let dir_top = p:\ath\to\a\directory;

libname lib_src  "&dir_top\dir_src";
libname lib_dest "&dir_top\dir_dest";


/* Create three datasets in library */
data lib_src.dataset_a; x = 'eggs'    ; run;
data lib_src.dataset_b; y = 'why'     ; run;
data lib_src.dataset_c; z = 'almost c'; run;


proc datasets
          lib = lib_src ;
     copy out = lib_dest;
run;
