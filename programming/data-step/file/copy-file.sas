%let cpDir = /share/home/tq84/sas/copyFile;
%put &=cpDir;

/* Using the x statement to create a file: */
x echo Line one>      &cpDir/orig.txt;
x echo Another line>> &cpDir/orig.txt;
x echo Third line>>   &cpDir/orig.txt;
x echo etc...>>       &cpDir/orig.txt;


/* Define filerefs for source and destination file: */
filename src "&cpDir/orig.txt";
filename dst "&cpDir/copy.txt";

/* Run the datastep to copy src to dst */
data _null_;
      infile  src;
      file    dst;
      input;
      put _infile_;
run;

/* Clear filerefs: */
filename src clear;
filename dst clear;
