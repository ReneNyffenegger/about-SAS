/* http://www2.sas.com/proceedings/forum2008/045-2008.pdf */
%let var1 = one;
%let var2 = two;
%let var3 = three;

%macro showVarValues;
   %do varNum = 1 %to 3;
       %put The value of var&varNum is &&var&varNum;
   %end;
%mend showVarValues;

%showVarValues
/*
The value of var1 is one
The value of var2 is two
The value of var3 is three
*/
