data _null_;

  home = sysget('HOME');
  user = sysget('USER');

  put 'HOME = ' home;
  put 'USER = ' user;
  
run;
