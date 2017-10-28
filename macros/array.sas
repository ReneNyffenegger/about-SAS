%macro tq84_array(values, delim=%str( ));
/*
    After an idea outlined in
      ARRAY.sas   (https://github.com/Jiangtang/SAS_ListProcessing/blob/master/ARRAY.sas)
    by
      Ted Clay  , M.S.   tclay@ashlandhome.net  (541) 482-6435
      David Katz, M.S.   www.davidkatzconsulting.com
     "Please keep, use and pass on the ARRAY and DO_OVER macros with
      this authorship note.  -Thanks "
*/

   %local array_name;
   %let   array_name = %tq84_createId(tq84_array_);

   %local elem_val i;
   %let   elem_val = qqqqqqqqqq;
   %let   i        = 1;
   %let   elem_val = %scan(%str(&values), &i, %str(&delim));

   %do %while (&elem_val ne %str());
       %global &array_name&i;
       
       %let    &array_name&i=&elem_val;

       %let i       = %eval(&i + 1);
       %let elem_val= %scan(%str(&values), &i, %str(&delim));

  %end;

  %global &array_name.s;
  %let    &array_name.s = %eval(&i-1);

  &array_name

%mend tq84_array;



%macro tq84_arrayLength(array);
       &&&array.s
%mend  tq84_arrayLength;


%macro tq84_arraySetVal(array, pos, val);

   %local len;
   %let   len = %tq84_arrayLength(&array);

   %if &len < &pos %then %do;
       %put tq84_arraySetVal: array &array: pos = &pos, but length only &len;
       %abort;
   %end; %else %do;
        %global &array&pos;
        %let    &array&pos=&val;
   %end;

%mend  tq84_arraySetVal;


%macro tq84_arrayGetVal(array, pos);

   %local len;
   %let   len = %tq84_arrayLength(&array);

   %if &len < &pos %then %do;
       %put tq84_arraySetVal: array &array: pos = &pos, but length only &len;
       %abort;
   %end; %else %do;
        %global &array&pos;
        &&&array&pos
   %end;

%mend  tq84_arrayGetVal;


%macro tq84_arrayPushBack(array, val);

   %local len;
   %let   len = %tq84_arrayLength(&array);

   %let   len = %eval(&len+1);

   %let    &array.s=&len;
   %tq84_arraySetVal(&array, &len, &val)

%mend  tq84_arrayPushBack;


%macro tq84_arrayApply(array, funcref);
    
    %local macroName;
    %let   macroName = %tq84_createMacro_M(&funcref, this);

    %local i;
    %do i = 1 %to &&&array.s;
        %&macroName(&&&array.&i)
    %end;

%mend  tq84_arrayApply;


%macro tq84_arrayMap(array, funcref);
 
  %local macroNameAM;
  %let   macroNameAM = %tq84_createMacro_M(&funcref, this);
  
  %local ret;
  %let   ret = %tq84_array();

  %tq84_arrayApply(&array, %nrstr(
       %put this = &this;

       %local evaluated;
       %let   evaluated = %&macroNameAM(&this);

       %tq84_arrayPushBack(&ret, &evaluated)
  ))

  &ret

%mend  tq84_arrayMap;


%macro tq84_arrayJoin(array, delim=%str( ));
   
   %local ret;
   %local i;

   %do i = 1 %to %tq84_arrayLength(&array);

      %if &i > 1                         %then %do;
          %let ret = &ret&delim;
      %end;

      %let ret = &ret%tq84_arrayGetVal(&array, &i);

   %end;
  
   &ret

%mend tq84_arrayJoin;
