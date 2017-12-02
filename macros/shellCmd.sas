%macro tq84_shellCmd(cmd);
  filename tq84_sh pipe "&cmd";
  data _null_;
    infile tq84_sh truncover;
    input  line $256.;
    put    line;
  run;
%mend  tq84_shellCmd;
