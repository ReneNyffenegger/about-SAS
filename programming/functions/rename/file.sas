%let dir_top =  \\datenpool.prod.zkb.ch\Datenpl$\Atrans\SASCC\tq84\sas;

%let dir_top = p:\ath\to\a\directory;
%let dir_a = &dir_top\dir_a;
%let dir_b = &dir_top\dir_b;


data _null_;

  file "&dir_a\file.txt";

  put "foo" "bar" "baz";
  put "one" "two" "three";
  put "x" "y" "z";

run;


%let rc = %sysfunc(rename(&dir_a\file.txt, &dir_b\renamed-and-moved.txt, file));
%put rc = &rc; /* rc = 0 */
