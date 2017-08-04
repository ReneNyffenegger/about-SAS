/*
    Assign fileref tq84_fr to an external file.

    Note: Maximum length of fileref is eight characters (bytes).
    Longer filerefs throw
       ERROR: Invalid logical name

*/
filename tq84_fr 'S:\Atrans\SASCC\tq84\numbers.dat';


data tq84_ext_file; 

 infile tq84_fr;

 /* Read line for line */
 input;
   
 /* Assign each line to variable line: */
 line = _infile_;
run;

proc print data = tq84_ext_file;
run;
