%macro sashelp_objtype(objtype);
  proc sql;
    create table work.objtype_&objtype as
    select 
        objname                  as name,
        memname                  as member,
        objdesc                  as descr
    from
        dictionary.catalogs
    where
        libname = 'SASHELP' and
        objtype = "&objtype"
    order by
        objname,
        memname;
  quit;
  %local objtype_lc;
  %let   objtype_lc=%sysfunc(lowcase(&objtype));
  filename out "/share/home/tq84/sas/objtypes/&objtype_lc";
  data _null_;
       file out;
       set  work.objtype_&objtype;
       put  name   $20.
            member $10.
            descr;
  run;
  filename out clear;
%mend  sashelp_objtype;

proc sql;
  create table work.sashelp_objtypes as
  select distinct objtype
  from   dictionary.catalogs;
quit;

data _null_;
     set work.sashelp_objtypes;
     call execute(cat('%sashelp_objtype(', objtype, ')'));
run;
