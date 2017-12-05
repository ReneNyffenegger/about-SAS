filename filref '/tmp/tq84.out';

data _null_;
   fid = fopen('filref', 'o', , 'b');
   if fid = 0 then do;
      err = sysmsg();
      put err;
      abort;
   end;
   /*                 */ col = fcol(fid); put col=; /* col=1 */
   rc=fput(fid, 'abc' ); col = fcol(fid); put col=; /* col=4 */
   rc=fput(fid, 'x'   ); col = fcol(fid); put col=; /* col=5 */
   rc=fput(fid, '!!'  ); col = fcol(fid); put col=; /* col=7 */
   rc=fput(fid, '0a'x ); col = fcol(fid); put col=; /* col=8 */
   rc=fwrite(fid      ); col = fcol(fid); put col=; /* col=1 */
run;
