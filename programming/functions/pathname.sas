libname  tq84_lib 'p:\ath\to\directory';
filename tq84_fil 'p:\ath\to\directory\dat.txt';


data _null_;

  length libpath  $ 256
         filepath $ 256;

  libpath  = pathname('tq84_lib');
  filepath = pathname('tq84_fil');

  put libpath=;
  put filepath=;
run;
