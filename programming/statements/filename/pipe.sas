filename tq84_tmp pipe 'ls -l /tmp/*.log';

data _null_;
  infile tq84_tmp truncover;
  input filename $256.;
  put filename=;
run;
