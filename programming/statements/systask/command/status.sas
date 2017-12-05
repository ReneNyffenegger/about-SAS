systask
  command "ls -l %sysfunc(getoption(work))"
  status  = rc_ls
  wait;

%put &=rc_ls; /* RC_LS=0 */

systask
  command "touch /cannot/touch/this/file/because/directory/does/not/exist"
  status  = rc_ls
  wait;

%put &=rc_ls; /* RC_LS=1 */
