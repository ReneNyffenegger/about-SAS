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

%macro readLine;
  %checkRC(%str(fread(fil)))
  %checkRC(%str(fget (fil, line)))
%mend  readLine;

data _null_;
   fil = fopen('filref', 'i', , 'v');
   if fil = 0 then do;
      err = sysmsg();
      put "Could not open file";
      put  err;
   end;
   
/* Specify line feed (0x0A) as seperator so as to read to
   the end of a line: */
   %checkRC(%str(fsep(fil, 'a', 'x')))

/* Initialize the varialbe that will store the line read: */
   line = repeat(' ', 200);

/* Read the five lines in /tmp/tq84.txt: */
   %readLine put line;
   %readLine put line;
   %readLine put line;
   %readLine put line;
   %readLine put line;

/* Next readLine will cause
      Error with fread(fil)
      WARNING: End of file. */
   %readLine
run;
