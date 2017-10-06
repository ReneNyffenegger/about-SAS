data tq84_nums;

  do num = 1 to 50;
     txt = put(num, words30.);
     output;
  end;

run;

proc sql;
  select
    num,
    txt,
    case
      when num = 1 then 'prime'
      when num = 2 then 'prime'
      when mod(num, 2) = 0 then 'multiple of 2'
      when mod(num, 3) = 0 then 'multiple of 3'
      when mod(num, 5) = 0 then 'multiple of 5'
      when mod(num, 7) = 0 then 'multiple of 7'
      else 'prime'
   end as is_prime
  from
   tq84_nums;
quit;
