data _null_;

  rep_0=repeat('abc', 0);
  rep_1=repeat('def', 1);
  rep_2=repeat('ghi', 2);

  put rep_0; /* abc       */
  put rep_1; /* defdef    */
  put rep_2; /* ghighighi */

run;
