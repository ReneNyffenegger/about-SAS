%macro oregon_trail(state);
  /* 
     Use str because NE and OR are mnemonics with special meaning to the macro processor

     Found in http://www2.sas.com/proceedings/forum2007/152-2007.pdf (Ex_1) 
  */

  %if &state eq %str(NE) or
      &state eq %str(OR) or
      &state eq      MO  or
      &state eq      KS  or
      &state eq      WY  or
      &state eq      ID
  %then
    %put The Oregon Trail ran through &state;
  %else
    %put The Oregon Trail did not run through &state;
%mend oregon_trail;

%oregon_trail(NY);
%oregon_trail(%str(OR));
%oregon_trail(%quote(NE));
%oregon_trail(WY);
