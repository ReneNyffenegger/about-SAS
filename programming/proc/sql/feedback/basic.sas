data dat;
  id  =  42;
  val = 'Hello world';
  output;
run;

%macro tq84_gt_twenty_four(x);
  &x gt 42
%mend  tq84_gt_twenty_four;

%let tq84_val=xyz;

proc sql feedback;
  select
    *
  from
    dat
  where
    %tq84_gt_twenty_four(id)
    &
    val <> "&tq84_val"
  ;
/*
    The feedback options writes into the log file
    what the sql statement is actually turned into:

         select DAT.id, DAT.val
                from WORK.DAT
               where (DAT.id > 42) and (DAT.val not = 'xyz');

*/
quit;
