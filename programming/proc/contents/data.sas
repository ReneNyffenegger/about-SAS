data foo;
  attrib col_1 length=$10;
  attrib col_2 length=  8;
  col_1='abc'; col_2 = 42; output;
  col_1='def'; col_2 =  1; output;
  col_1='ghi'; col_2 = 99; output;
run;

proc contents
     data = foo;
run;

/*
The CONTENTS Procedure

Data Set Name        WORK.FOO                                                 Observations          3
Member Type          DATA                                                     Variables             2
Engine               V9                                                       Indexes               0
Created              11/29/2017 16:40:24                                      Observation Length    24
Last Modified        11/29/2017 16:40:24                                      Deleted Observations  0
Protection                                                                    Compressed            NO
Data Set Type                                                                 Sorted                NO
Label
Data Representation  SOLARIS_X86_64, LINUX_X86_64, ALPHA_TRU64, LINUX_IA64
Encoding             latin1  Western (ISO)


                                 Engine/Host Dependent Information

Data Set Page Size          65536
Number of Data Set Pages    1
First Data Page             1
Max Obs per Page            2714
Obs in First Data Page      3
Number of Data Set Repairs  0
Filename                    /var/app/sas/work/SAS_work411300009AD8_host.ch/foo.sas7bdat
Release Created             9.0401M3
Host Created                Linux
Inode Number                96731147
Access Permission           rw-rw----
Owner Name                  tq84
File Size                   128KB
File Size (bytes)           131072


Alphabetic List of Variables and Attributes

#    Variable    Type    Len

1    col_1       Char     10
2    col_2       Num       8
*/
