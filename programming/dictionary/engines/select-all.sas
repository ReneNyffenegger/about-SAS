proc sql;
  select
    engine,
    description,
/*  properties, */
    preferred
  from
    dictionary.engines
  order by
    preferred desc,
    engine;
quit;
/*
ASTER     SAS/ACCESS to Aster nCluster              yes
BLOOMBRG  SAS/Access Interface To Bloomberg         yes
CRSPCCM   Access to Expressfeed CCM databases       yes
CVP       Character Variable Padding Engine         yes
DB2       SAS/ACCESS to DB2                         yes
FEDSVR    DataFlux Federation Server Engine         yes
GREENPLM  SAS/ACCESS to Greenplum                   yes
HADOOP    SAS/ACCESS to Hadoop                      yes
HAWQ      SAS/ACCESS Interface to HAWQ              yes
HPDATA    High Performance Distributed Data Engine  yes
IMDB      In Memory Database Engine                 yes
IMPALA    SAS/ACCESS Interface to Cloudera Impala   yes
INFOMAPS  SAS Information Maps Engine               yes
INFORMIX  SAS/ACCESS to Informix                    yes
JMP       Base SAS Libname JMP Engine               yes
META      Metadata engine                           yes
MYSQL     SAS/ACCESS Interface to MySQL             yes
NEOVIEW   SAS/ACCESS Interface to HP Neoview        yes
NETEZZA   SAS/ACCESS Interface to Netezza           yes
ODBC      SAS/ACCESS to ODBC                        yes
OLAP      SQL Passthru Engine for OLAP              yes
ORACLE    SAS/ACCESS to Oracle                      yes
OSIRIS    OSIRIS Data File engine                   yes
PCFILES   SAS/ACCESS to PC Files Server             yes
PIAF      SAS/ACCESS Interface to the PI System As  yes
PISYSAF   SAS/ACCESS Interface to the PI System As  yes
PISYSTEM  SAS/ACCESS Interface to the PI System     yes
POSTGRES  SAS/ACCESS Interface to PostgreSQL        yes
R3        SAS Engine for SAP R/3                    yes
REMOTE    SAS/SHARE Remote access engine            yes
REMOTE8   SAS/SHARE V8 Remote access engine         yes
REUTERS   Reuters financial market data interface   yes
SAPHANA   SAS/ACCESS Interface to SAP HANA          yes
SASECRSP  Access to CRSPAccess database             yes
SASEFAME  Access to FAME CHLI database              yes
SASEFRED  ETS Interface Engine to FRED Data         yes
SPDE      Scalable Performance Data Engine          yes
SPSS      SPSS Save File engine                     yes
SQLSVR    SAS/ACCESS Interface to Microsoft SQL Se  yes
SQLVIEW   SQL view engine                           yes
SYBASE    SAS/ACCESS to Sybase                      yes
SYBASEIQ  SAS/ACCESS to Sybase IQ                   yes
TERADATA  SAS/ACCESS to Teradata                    yes
TRACE     Version 7 trace engine                    yes
V6        Base SAS I/O Engine                       yes
V6TAPE    Version 6 sequential engine               yes
V9        Base SAS I/O Engine                       yes
V9TAPE    Version 7 sequential engine               yes
VERTICA   SAS/ACCESS Interface to Vertica           yes
XLSX      SAS Interface to XLSX Files               yes
XML       W3C XML input/output engine               yes
XMLV2     W3C XML input/output engine               yes
XPORT     Version 5 transport datasets              yes
BASE      Base SAS I/O Engine                       no
CRSPACC   Access to CRSPAccess database             no
DB2_6000  DB2 Unix engine                           no
DB2_UNIX  DB2 Unix engine                           no
FAMECHLI  Access to FAME CHLI database              no
SASTS     SAS Table Services Engine                 no
SXLE      W3C XML input/output engine               no
TAPE      Version 7 sequential engine               no
V607      Base SAS I/O Engine                       no
V608      Base SAS I/O Engine                       no
V609      Base SAS I/O Engine                       no
V610      Base SAS I/O Engine                       no
V611      Base SAS I/O Engine                       no
V612      Base SAS I/O Engine                       no
V7        Base SAS I/O Engine                       no
V701      Base SAS I/O Engine                       no
V7TAPE    Version 7 sequential engine               no
V8        Base SAS I/O Engine                       no
V8TAPE    Version 7 sequential engine               no
XML92     W3C XML input/output engine               no
*/
