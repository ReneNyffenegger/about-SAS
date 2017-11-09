options pagesize=100;
%put pagesize = %sysfunc(getoption(pagesize              )); /* pagesize = 100               */
%put pagesize = %sysfunc(getoption(pagesize, howset      )); /* pagesize = Options Statement */
%put pagesize = %sysfunc(getoption(pagesize, defaultvalue)); /* pagesize = 21                */
%put pagesize = %sysfunc(getoption(pagesize, startupvalue)); /* pagesize = 60                */
%put pagesize = %sysfunc(getoption(pagesize, howscope    )); /* pagesize = IOM ROOT COMP ENV */
