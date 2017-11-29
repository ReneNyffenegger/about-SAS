%let files=%tq84_filesInDirectory(/home/tq84);

/* tq84_filesInDirectory returns an array. So, we can iterate over it: */
%tq84_arrayApply(&files,%nrstr(
  %put file=&this;
))
