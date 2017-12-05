/* Create a file: */
systask command "echo foo bar baz>/tmp/fbb.txt" wait shell='sh';

systask command "cat /tmp/fbb.txt" wait status=rc;

filename filref '/tmp/fbb.txt';
data _null_;
   fid = fopen('filref', 's');
   if fid = 0 then do;
      err = sysmsg();
      put err;
      abort;
   end;
   nofAttrs = foptnum(fid);
   put "File has " nofAttrs "attributes.";
/* Log: File has 6 attributes.
   .
   Iterate over each attribute: */
   do attrNo=1 to nofAttrs;
      attrName =foptname(fid, attrNo  );
      attrValue=finfo   (fid, attrName);
      put attrName @30 attrValue;
   end;
/*
   File has 6 attributes.
   Filename                     /tmp/fbb.txt
   Owner Name                   tq84
   Group Name                   users
   Access Permission            -rw-r--r--
   Last Modified                05Dec2017:15:37:32
   File Size (bytes)            12
*/
run;
filename filref clear;
