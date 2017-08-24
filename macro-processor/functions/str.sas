* quote special tokens such as semicolons, percent signs and ampersands;
%let  s=%str(semicolon; %percent; &ampersand);
%put &s;
