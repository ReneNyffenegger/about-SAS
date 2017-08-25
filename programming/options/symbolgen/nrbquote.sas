options symbolgen;

%let some_text = %nrbquote( 7*6=42, the question's answer );

%put >>&some_text<<;
