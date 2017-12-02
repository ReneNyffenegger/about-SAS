filename tq84_pip pipe 'ls -l /tmp/*.log';

data _null_;
  infile tq84_pip truncover;
  input  line $256.;
  put    line=;
run;
