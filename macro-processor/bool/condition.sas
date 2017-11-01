%macro tq84_put_condition(expr);
   %put &expr : %eval(&expr);
%mend  tq84_put_condition;

%tq84_put_condition(4 < 10); /* 4 < 10 : 1 */
%tq84_put_condition(4 > 10); /* 4 > 10 : 0 */
