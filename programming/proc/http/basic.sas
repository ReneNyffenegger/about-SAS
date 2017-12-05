filename dl '/share/home/tq84/sas/proc-http.sas';

proc http
  method = 'GET'
  url    = 'https://github.com/ReneNyffenegger/about-SAS/blob/master/programming/proc/http/basic.sas'
  out    =  dl;
run;
