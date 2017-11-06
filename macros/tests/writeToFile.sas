%macro writeToFileTest;
  
   %do i = 1 %to 100;
   %do j = 1 %to &i;
       %tq84_writeToFile(%sysget(HOME)/writeToFileTest/&i..txt, &j)
   %end; %end;

%mend writeToFileTest;

%writeToFileTest;
