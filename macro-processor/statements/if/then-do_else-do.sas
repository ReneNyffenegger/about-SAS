%macro greater(a, b);
  
  %if &a gt &b
    %then
      %do;
        %put a is greater than b;
        %put b is less than a;
      %end;
    %else
      %do;
        %put a is less or equal than b;
        %put b is greater or equal than a;
      %end;
       
%mend greater;

%greater(10, 20);
%greater(20, 20);
%greater(30, 20);
