data tq84_data;
 
   length txt $9;
   
/* A is 41 in hex, B 42 etc. */
   txt = cat('ABC', '010203'x, 'DEF');
   
   put txt= $hex.; /* txt=414243010203444546 */

run;
