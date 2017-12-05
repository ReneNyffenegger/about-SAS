/*
   https://blogs.sas.com/content/sasdummy/2014/01/29/using-filename-zip/zip
*/
%let zipDir = /share/home/tq84/sas/zip;

x mkdir -p &zipDir;

/* Create three files for the zip file: */
x echo one two three>     &zipDir/A.txt;
x echo four five>>        &zipDir/A.txt;
x echo six seven eight>>  &zipDir/A.txt;
x echo nine>>             &zipDir/A.txt;

x echo Line ONE>          &zipDir/B.txt;
x echo Line TWO>>         &zipDir/B.txt;

x echo foo bar baz>       &zipDir/C.txt;

/* Create the zip file using the x statement: */
x "cd &zipDir; /usr/app/oracle/product/12.1.0.2.c/bin/zip files.zip *.txt";


/* Display content of zip file: */
filename zipFile zip "&zipDir/files.zip";
data _null_;
   fZip = dopen('zipFile');
   if fZip = 0 then do;
      err = sysmsg();
      put err;
      abort;
   end;
   cntFilesInZip = dnum(fZip);
   put "There are " cntFilesInZip "files in the zip file.";
/* There are 3 files in the zip file. */
   do fileNo = 1 to cntFilesInZip;
      fileName = dread(fZip, fileNo);
      put "File " fileNo "is: " fileName;
/*    File 1 is: A.txt */
/*    File 2 is: B.txt */
/*    File 3 is: C.txt */
   end;
   rc=dclose(fZip);
run;
filename zipFile clear;

/* Now that we have the files zipped, we can delete
   the .txt files: */ 
x "rm &zipDir/*.txt";



/* Extract the members from the zip file again. */

%macro extractZippedFile(member);
   filename zipMembr zip "&zipDir/files.zip" member="&member";
   filename unzipped     "&zipDir/&member";
   data _null_;
         infile  zipMembr;
         file    unzipped;
         input;
         put _infile_;
   run;
   filename zipMembr clear;
   filename unzipped clear;
%mend;

%extractZippedFile(A.txt)
%extractZippedFile(B.txt)
%extractZippedFile(C.txt)
