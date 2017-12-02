data transform;
  id  =  42;
  val = 'Hello world';
  output;
run;

proc sql feedback;
  select
    t.*
  from
    transform t
  where
    val ?  '?'   /* ?  is expanded to 'contains' */
    &            /* &  is expanded to 'and'      */
    val gt 'gt'  /* gt is expanded to '>'        */
    |            /* |  is expanded to '|'        */
    val lt 'lt'  /* lt is expanded to '<'        */
    !            /* !  is expanded to 'or'       */
    val eq 'eq'  /* eq is expanded to '='        */
    ;
  /* After expansion, the statement becomes (after
     manually reformatting it a bit)
       select
         T.id,
         T.val
       from
         WORK.TRANSFORM T
       where 
       (
           T.val contains '?' and
         ( T.val > 'gt')
       ) or
       (   T.val < 'lt'
       ) or (
         (T.val =   'eq') and 
         (T.val eqt 'eqt')
      );
  */
quit;
