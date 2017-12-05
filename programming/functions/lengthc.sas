data _null_;
  format var_1  $42.;
  var_2 = 'foo bar baz';
  l=length (var_1); put l=; /* l=1  */
  c=lengthc(var_1); put c=; /* c=42 */
  l=length (var_2); put l=; /* l=11 */
  c=lengthc(var_2); put c=; /* c=11 */
  var_2 = 'xyz';
  l=length (var_2); put l=; /* l=3  */
  c=lengthc(var_2); put c=; /* c=11 */
run;
