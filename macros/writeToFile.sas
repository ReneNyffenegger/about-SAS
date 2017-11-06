%macro tq84_writeToFile_M;
   data _null_;
      file &filename mod;
      put  &txt;
   run;
%mend  tq84_writeToFile_M;


proc fcmp outlib=work.funcs.tq84;
  subroutine tq84_writeToFile_F(fileName$, txt$);
    rc = run_macro('tq84_writeToFile_M', fileName, txt);
  endsub;
run;

options cmplib=work.funcs;

%macro tq84_writeToFile(fileName, txt);
  %sysfunc(tq84_writeToFile_F(&fileName, &txt));
%mend  tq84_writeToFile;
