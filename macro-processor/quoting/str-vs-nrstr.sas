%let mv      =%nrstr(Acme&Co);

%let mv_str  =%str  (&mv    );
%let mv_nrstr=%nrstr(&mv    );

%put &mv_str.;    /* Acme&Co */
%put &mv_nrstr.;  /* &mv     */
