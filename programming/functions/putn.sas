data _null_;

   num_days_since_jan_1st_1960 = 15;

/* Convert the numeric value num_days_since_jan_1st_1960
   to a character with width=11.
   Since num_days_since_jan_1st_1960 is a numeric, we
   use putn (rather than putc) */
   format_ = 'date';
   width   = 11;
   
   dt = putn(num_days_since_jan_1st_1960, format_, width);
   put dt=;

   dt_type = vtype(dt);
   put dt_type=;

run;
