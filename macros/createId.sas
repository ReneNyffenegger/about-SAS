%global tq84_idCounter;
%let    tq84_idCounter = 0;

%macro tq84_createId(prefix);

   %local  idRet;

   %let  idRet = &prefix&tq84_idCounter._;
   %let  tq84_idCounter = %eval(&tq84_idCounter + 1);

   &idRet

%mend  tq84_createId;
