data tq84_data;

  length txt $9;

  txt = cat('ABC', '010203'x, 'DEF');
  
  put txt= $hex.;

run;
