options nodlcreatedir;
%let dir=%sysfunc(getoption(work))/libDir;
libname ldir "&dir";
/* Log says:
   NOTE: Library LDIR does not exist
*/

options dlcreatedir;
libname ldir "&dir";
/* Log says:
   NOTE: Library LDIR was created.
   NOTE: Libref LDIR was successfully assigned as follows:
         Engine:        V9
         Physical Name: /var/app/sas/work/SAS_work9F6500009AA7_sas.renenyffenegger.ch/libDir
*/
