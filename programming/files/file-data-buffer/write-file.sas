%let dirname=/tmp;
%let filename=&dirname/tq84.txt;
filename filref "&filename";

%macro checkRC(func);
  rc = &func;
  if rc ~= 0 then do;
     err  =sysmsg();
     %let funcQ=%sysfunc(quote(&func));
     put  "Error with " &funcQ;
     put  err;
     abort;
  end;
%mend  checkRC;

%macro writeLine(text);
  %checkRC(%str(fput  (fil, "&text")))
  %checkRC(%str(fwrite(fil, ' ')))
%mend  writeLine;

data _null_;
  fil = fopen('filref', 'o', , 'v');
  if fil = 0 then do;
     err = sysmsg();
     put "Could not open file";
     put  err;
  end;

  %writeLine(This is the first line.)
  %writeLine(This is the second line.)
  %writeLine(Here comes the third line.)
  %writeLine(And the fourth one.)
  %writeLine(%quote(Finally, this is the last (that is: fifth) line.))

 %checkRC(%nrstr(fclose(fil)))
run;
