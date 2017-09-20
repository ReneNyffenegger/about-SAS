
%let tq84_lib_path="/home/rene/del_test";
libname tq84_lib "&tq84_lib_path";

data tq84_lib.member_one;
  x = 'foo';
  y =  42;
run;

data tq84_lib.member_two;
  x = 'bar';
  y =  99;
run;


filename tq84_f1 "&tq84_lib_path/member_one.sas7bdat";
filename tq84_f2 "&tq84_lib_path/member_two.sas7bdat";

data _null_;
  
  rc = fdelete('tq84_f1');

  if rc = 0 then put "File was succesfully deleted";
            else put "File was not deleted";
  
run;

%macro tq84_fdelete;
/* %if not valid in open code, only in macro definition.
   Therefore, creating a macro to test return value of fdelete */

/* Note: When fdelete is used in a macro, the fileref
   needs not be quoted: */
   %let rc=%sysfunc(fdelete(tq84_f2));

   %if &rc = 0 %then %put File was successfully deleted;
               %else %put File was not deleted;

%mend;

%tq84_fdelete;
