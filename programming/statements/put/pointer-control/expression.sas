/* +(expr) moves the pointer to the column expr. */

data _null_;

  do pos=1 to 20;
     put +(pos) '*';
  end;

run;
