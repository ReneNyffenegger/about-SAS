/* 
  https://blogs.sas.com/content/sasdummy/2011/06/17/how-to-use-sas-data-step-to-copy-a-file-from-anywhere/
*/

x echo first line>   /tmp/tq84.src;
x echo second line>> /tmp/tq84.src;
x echo third line>>  /tmp/tq84.src;
x echo fourth line>> /tmp/tq84.src;

filename fil_src  '/tmp/tq84.src';
filename fil_dst  '/tmp/tq84.dst';

data _null_;
   fid_src = fopen('fil_src', 'i', 1, 'b'); 
   fid_dst = fopen('fil_dst', 'o', 1, 'b');
   rec = '.';
   do while (fread(fid_src)=0);
      rc=fget     (fid_src, rec, 1);
      rc=fput     (fid_dst, rec   );
      rc=fwrite   (fid_dst);
   end;
   rc=fclose(fid_src);
   rc=fclose(fid_dst);
run;
