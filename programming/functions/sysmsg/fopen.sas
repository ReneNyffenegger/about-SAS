filename tq84_fil '/file/that/does/not/exist';

data _null_;
  f = fopen('tq84_fil', 'i');
  if f eq 0 then do;
     reason = sysmsg();
     put 'Could not open file for reading.';
     put 'Reason: ' reason;
  end;
run;
/*
Could not open file for reading.
Reason: ERROR: Physical file does not exist /file/that/does/not/exist
*/
