filename ls_ltr pipe 'ls -ltr /tmp';

%let line_len=100;
data ls_ltr_result;
  length line $&line_len;
  infile ls_ltr length=reclen;

  input line $varying&line_len.. reclen;
run;

proc print data = ls_ltr_result; run;
