%let path1 = /this/file/most/probably/does/not/exist;
%let path2 = %sysfunc(getoption(work))/sas.lck;

filename fileref1 "&path1";
filename fileref2 "&path2";

data _null_;
  fileRefOk1 = fexist('fileref1');
  fileRefOk2 = fexist('fileref2');
  fileRefOk3 = fexist('fileref3');

  put fileRefOk1=; /* fileRefOk1 = 0 */
  put fileRefOk2=; /* fileRefOk2 = 1 */
  put fileRefOk3=; /* fileRefOk3 = 0 */
run;
