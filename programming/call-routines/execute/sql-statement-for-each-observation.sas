%let dir_A = "/share/&context_unxname/work/tq84/lib_A";
%let dir_B = "/share/&context_unxname/work/tq84/lib_B";

/* These are the directories in which some
   data sets will be created: */
%let dir_A = "/path/to/dir/A";
%let dir_B = "/path/to/dir/B";


/* Create two data sets in each directory: */
libname tq84_lib &dir_A;

        data tq84_lib.a_one; x = 'a one'; run;
        data tq84_lib.a_two; x = 'a two'; run;

libname tq84_lib &dir_B;

        data tq84_lib.b_one; x = 'b one'; run;
        data tq84_lib.b_two; x = 'b two'; run;

libname tq84_lib clear;

/* Create our tables for processing: */
proc sql; /* Create table for members */

   /* tq84_paths will just contain the paths of the libraries: */
   create table work.tq84_paths (
     path    char(255) not null,
     constraint tq84_paths_pk primary key(path)
   );

   /* tq84_members will be filled for each path/library in its
      parent table: */
   create table work.tq84_members(
     path    char(255) not null,
     member  char( 30) not null,
     constraint tq84_members_fk foreign key (path) references tq84_paths
   );

quit;

/* Manually fill our tq84_paths table: */
proc sql;
  insert into work.tq84_paths values (&dir_A);
  insert into work.tq84_paths values (&dir_B);
quit;


/* This macro will fill tq84_members with the
   members of the library whose path is passed
   in the macro argument: */
%macro tq84_fill_members(path);
  libname lib_nam "&path";
  proc sql;
    insert into work.tq84_members(path, member)
    select
      "&path", memname
    from
      dictionary.members
    where
      libname = 'LIB_NAM';
  quit;
  libname lib_name clear;
%mend;
     

/* Use execute to call the macro for each
   observation */
data _null_;
  set  work.tq84_paths;
  call execute(cat('%tq84_fill_members(', path, ')'));
run;

/* Check what was filled: */
proc sql;
  select * from work.tq84_members;
quit;
