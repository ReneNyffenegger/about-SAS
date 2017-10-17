%macro compareDatasetStructure(
            dataset_a,
            dataset_b,
            libname_a = work,
            libname_b = work);


   %local create_table_stmt;
   %let create_table_stmt =
        create table tq84_dict_col_# as
               select * from dictionary.columns
               where libname = upcase("&&libname_#") and
                     memname = upcase("&&dataset_#");

   %local cmp_column;
   %let   cmp_column = 
      case
         when a.name is not null and b.name is not null then
              case when a.# ne b.# then
                   cats(a.#, ' != ', b.#)
              else
                /* This cats seems unnecessary at first, but
                   is used to result a consistent data type
                   accross all evaluation paths within this
                   case when statement. Same thing further
                   below...*/
                   cats(a.#,'')
              end
         else
              cats(a.#, b.#)
      end as #;

   proc sql;
       %sysfunc(tranwrd(&create_table_stmt, #, a));
       %sysfunc(tranwrd(&create_table_stmt, #, b));
  
     select
      coalesce(a.name, b.name) as column_name,
      case
         when a.name is null then "Missing in &libname_a..&dataset_a"
         when b.name is null then "Missing in &libname_b..&dataset_b"
         else ""
      end as missing_in1,
      %sysfunc(tranwrd(&cmp_column, #, type  )),
      %sysfunc(tranwrd(&cmp_column, #, length)),
      %sysfunc(tranwrd(&cmp_column, #, npos  ))
    from
      tq84_dict_col_a a                                      full outer join
      tq84_dict_col_b b  on upcase(a.name) = upcase(b.name)
    order by
      coalesce(a.varnum, b.varnum);
     
  quit;

%mend compareDatasetStructure;
