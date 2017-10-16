%macro directory_seperator;
/* Expands to a slash (/) on Unix systems and a
   backslash on Windows (\) */
   %qsysfunc(ifc(&sysscp = WIN,\,/))
%mend  directory_seperator;
