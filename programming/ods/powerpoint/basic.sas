ods powerpoint file='/share/home/tq84/sas/ods/tq84.pptx';

proc gchart
     data = sashelp.cars;
     vbar origin /
       sumvar    = msrp
       type      = mean
       patternid = midpoint;
run;
quit;

ods powerpoint close;
