%macro intDt(prefix);

  prefix="&prefix";
  
  dd  = put(25252, &prefix.dfdd10.);
  de  = put(25252, &prefix.dfde.  );
  dn  = put(25252, &prefix.dfdn.  );
  dt  = put(25252, &prefix.dfdt.  );
  dwn = put(25252, &prefix.dfdwn. );
  
  put prefix  1-3
      dd      6-16
      de     18-28
      dn     30-31
      dt     33-52
      dwn    54-72
  ;
%mend  intDt;

data _null_;
  %intDt(AFR)
  %intDt(CAT)
  %intDt(CRO)
  %intDt(CSY)
  %intDt(DAN)
  %intDt(DES)
  %intDt(DEU)
  %intDt(ENG)
  %intDt(ESP)
  %intDt(EUR)
  %intDt(FIN)
  %intDt(FRA)
  %intDt(FRS)
  %intDt(HUN)
  %intDt(ITA)
  %intDt(MAC)
  %intDt(NLD)
  %intDt(NOR)
  %intDt(POL)
  %intDt(PTG)
  %intDt(RUS)
  %intDt(SLO)
  %intDt(SVE)
run;
/*
AFR  19.02.2029  19Feb29     1  01Jan60:07:00:52       Maandag
CAT  19/02/2029  19Feb29     1  01Gen60:07:00:52       Dilluns
CRO  19.02.2029  19vel29     1  01sij60:07:00:52     ponedjelj
CSY  19/02/2029    19úno     1   01leden1960:07:     pond?lí
DAN  19.02.2029  19feb29     1  01jan60:07:00:52      mandag
DES  19.02.2029  19Feb29     1  01Jan60:07:00:52         Monta
DEU  19.02.2029  19Feb29     1  01Jan60:07:00:52         Monta
ENG  19.02.2029  19FEB29     1  01JAN60:07:00:52        Monday
ESP  19.02.2029  19feb29     1  01ene60:07:00:52         lunes
EUR  19.02.2029  19FEB29     1  01JAN60:07:00:52        Monday
FIN  19.02.2029    19.2.     1      1.1.60:07:00       Maanant
FRA  19/02/2029  19fev29     1  01jan60:07:00:52        Lundi
FRS  19/02/2029  19fev29     1  01jan60:07:00:52        Lundi
HUN    29.2.19.    29.fe     1      60.jan.1. 07         hétf?
ITA  19/02/2029  19Feb29     1  01Gen60:07:00:52        Lunedì
MAC  19.02.2029  19fev29     1  01jan60:07:00:52     ponedelni
NLD  19-02-2029  19feb29     1  01jan60:07:00:52       maandag
NOR  19.02.2029  19feb29     1  01jan60:07:00:52      mandag
POL  19-02-2029  19lut29     1  01sty60:07:00:52     poniedzia
PTG  19/02/2029  19fev29     1  01jan60:07:00:52     Segunda-f
RUS  19.02.2029  19???29     1  01???60:07:00:52     ?????????
SLO  19.02.2029  19feb29     1  01jan60:07:00:52     ponedelje
SVE  19.02.2029  19feb29     1  01jan60:07:00:52      Måndag
*/
