options nopresenv;

data work.ds_1; x=42; run;
option linesize = 100;

options presenv;
data work.ds_2; x=99; run;
option pagesize = 99;

filename sess_fil '/share/home/tq84/sas/presenv/session.sas';
libname  sess_lib '/share/home/tq84/sas/presenv';

proc presenv
     permdir = sess_lib
     sascode = sess_fil
     show_comments;
run;

systask command 'ls -ltr /share/home/tq84/sas/presenv' shell='bash';
/*

   Hm... Also ds_1 was created...

   -rw-r--r--. 1 tq84 nobody 131072 Dec  8 14:35 ds_1.sas7bdat
   -rw-r--r--. 1 tq84 nobody 131072 Dec  8 14:35 ds_2.sas7bdat
   -rw-r--r--. 1 tq84 nobody 122880 Dec  8 14:35 sasmacr.sas7bcat
   -rw-r--r--. 1 tq84 nobody   3382 Dec  8 14:35 session.sas
*/
