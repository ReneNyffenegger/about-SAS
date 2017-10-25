data _null_;

  val_1 = 'space-right ';
  val_2 = 'no-space';
  val_3 = ' space-left';
  val_4 = ' space-both ';
  val_5 = '<';

  sep   = '/';

  /* remove no spaces:                                     */ cat__ = cat (     val_1, val_2, val_3, val_4, val_5); 
  /* remove leading and trailing spaces:                   */ cats_ = cats(     val_1, val_2, val_3, val_4, val_5); 
  /* remove traling spaces only:                           */ catt_ = catt(     val_1, val_2, val_3, val_4, val_5); 
  /* insert seperator, remove leading and traling spacces: */ catx_ = catx(sep, val_1, val_2, val_3, val_4, val_5); 

  put cat__; /* space-right no-space space-left space-both < */
  put cats_; /* space-rightno-spacespace-leftspace-both<     */
  put catt_; /* space-rightno-space space-left space-both<   */
  put catx_; /* space-right/no-space/space-left/space-both/< */

run;
