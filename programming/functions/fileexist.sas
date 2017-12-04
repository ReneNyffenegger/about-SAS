data _null_;

  doesFileExist = fileexist('/most/probably/does/not/exist.txt');
  put doesFileExist=; /* doesFileExist=0 */

  doesFileExist = fileexist(getOption('work'));
  put doesFileExist=; /* doesFileExist=1 */

run;
