%macro deleteFile(fileName);
  filename fnam "&fileName";
  data _null_;
    if fexist("fnam") then do;
       put "&fileName exists, going to delete it.";
       rc = fdelete("fnam");
    end;
    else do;
       put "&fileName does not exist.";
       put "Nothing to do!";
    end;
  run;
  filename fnam clear;
%mend  deleteFile;

systask command "touch /tmp/tq84.txt" wait;
%deleteFile(/tmp/tq84.txt)
%deleteFile(/tmp/tq84.txt)
