proc format;
  value BMI
        low  - 18.5 = "Underweight"
        18.5 - 25   = "Normal weight"
        25   - 30   = "Overweight"
        30   - high = "Obese";
run;


data _null_;
  format w1-w4 BMI.;

  w1 = 22;
  w2 = 17;
  w3 = 30;
  w4 = 31;

  put w1-w4;
 
run;
