proc registry;
run;
/*
  NOTE: The following options can be specified:
  IMPORT="filename" or fileref -- Import from file
  EXPORT="filename" or fileref -- Export to file
  UNINSTALL="filename" or fileref -- Uninstall file
  COMPARETO="filename" or fileref -- Compare file
  STARTAT="key" -- Start EXPORT,LIST at key
  USESASHELP -- IMPORT,COMPARETO,UNINSTALL,EXPORT use system registry
  LIST -- List registry to log
  LISTUSER -- List user registry to log
  LISTHELP -- List system registry to log
  FULLSTATUS -- IMPORT, UNINSTALL list status info to log
  KEYSTATUS -- List open keys
  RUTHERE -- Presence test, validation check
  CLEARSASUSER -- Erase contents of user registry
  VALSTATUS -- List value date/time/state modification information
  DEBUGON -- Turn additional debugging messages ON
  DEBUGOFF -- Turn additional debugging messages OFF
  UPCASE -- Upper case all incoming keys and value names
*/
