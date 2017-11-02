%let workDir = /home/rene;

libname libMacro "&workDir/macros";

options
  mstored
  sasmstore=libMacro;


/* Create a Compiled macro. It will be stored in
   &workDir/macros/sasmacr.sas7bcat                            */ 
%macro tq84_CompiledMacro / 
   des      = "Macro description"
   store    /* Store compiled macro in library identified by 
               SASMSTORE option.
               Requires MSTORED option to be set.               */
   source   /* Also store source code along with compiled code  */
;

 %put -------------------------------;
 %put This is macro &sysmacroname;
 %put -------------------------------;

%mend tq84_CompiledMacro;


/* Next day (or in new session).
   The macro is not known anymore, the statement
   throws 
      ERROR 180-322: Statement is not valid or it is used out of proper order. */
%tq84_CompiledMacro

/* Telling SAS, where the stored macros are: */
%let workDir = .... ;
libname libMacro "&workDir/macros";
options
  mstored
  sasmstore=libMacro;

/* The macro is now available */
%tq84_CompiledMacro


/* Since the 'source' options was specified when
   the macro was compiled, the source of the
   macro can be views with the copy statement: */
%copy tq84_CompiledMacro /source; 


proc sql;
   select
     objname as macro_name,
     objdesc,
     created,
     modified
   from
     dictionary.catalogs
   where
     libname = 'LIBMACRO' and
     memname = 'SASMACR'  and
     memtype = 'CATALOG'  and
     objtype = 'MACRO' ;
quit;
