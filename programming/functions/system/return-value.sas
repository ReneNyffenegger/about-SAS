data _null_;
  log_file = '/tmp/tq84.log';
  if system(cat('ls ', log_file)) <> 0 then do;
     put log_file ' does not exist, creating it.';
     call system (cat('touch ', log_file));
  end;
  /* */
  if system(cat('ls ', log_file)) = 0 then do;
     put log_file ' exists';
  end;
run;
