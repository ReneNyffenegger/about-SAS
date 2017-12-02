%macro ods_dest;
  proc sql flow=15;
    select * from dictionary.destinations;
  quit;
%mend ods_dest;

%ods_dest
/*
   Destination      Style
   --------------------------------
   LISTING          Listing
*/

ods html style=sasweb;
%ods_dest
/*
  Destination      Style
  --------------------------------
  LISTING          Listing
  HTML             SasWeb
*/

ods rtf;
%ods_dest
/*
  Destination      Style
  --------------------------------
  LISTING          Listing
  HTML             SasWeb
  RTF              Rtf
*/

ods html close;
%ods_dest
/*
   Destination      Style
   --------------------------------
   LISTING          Listing
   RTF              Rtf
*/
