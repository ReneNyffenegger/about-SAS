%macro tq84_lj(alias, name);
  left join dictionary.libnames &alias on
    lib.libname = &alias..libname and 
    lib.level   = &alias..level   and
    &alias..sysname = "&name"
%mend tq84_lj;

proc sql;

  create table work.libraries as
  select
    distinct libname, level
  from
    dictionary.libnames;

  select
    lib.libname,
    lib.level,
    sch.sysvalue  as schema             label "Schema"           , /* DB2 ?    */
    scu.sysvalue  as schema_user        label "Schema/user"      , /* Oracle ? */
    fnm.sysvalue  as file_name          label "File name"        ,
    per.sysvalue  as access_permission  label "Access permission",
    fsz.sysvalue  as file_size          label "File size"        ,
    fsb.sysvalue  as file_size_bytes    label "File size (bytes)",
    fid.sysvalue  as inode_number       label "Inode number"     ,
    fow.sysvalue  as owner_name         label "File owner"
  from
    work.libraries lib
   %tq84_lj(sch, Schema           )
   %tq84_lj(scu, Schema/User      )
   %tq84_lj(fnm, Filename         )
   %tq84_lj(per, Access Permission)
   %tq84_lj(fsz, File Size        )
   %tq84_lj(fsb, %str(File Size (bytes)))
   %tq84_lj(fid, Inode Number     )
   %tq84_lj(fow, Owner Name       );

quit;
