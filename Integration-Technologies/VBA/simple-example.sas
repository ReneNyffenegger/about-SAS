'
'  Type libraries to add:
'
'    o SAS: Integrated Object Model (SAS System 9.1)
'    o SASOMI: (SAS System 9.4) Type Library
'    o SASObjectManager 1.1 Type Library
'
'   http://blogs.sas.com/content/sasdummy/2013/03/13/using-powershell-with-sas-workspace/
'
'   Chris Hemedinger's paper "Create Your Own Client Apps Using SAS(R) Integration Technologies"
'      http://support.sas.com/resources/papers/proceedings13/003-2013.pdf
'
'   TODO:
'     http://www.sascommunity.org/wiki/Create_Your_Own_Client_Apps_Using_SAS_Integration_Technologies
'

private const host = "sasebisandbox.eng.zkb.ch"

sub test()
'
' First: create a connection to a workspace server
'

  dim wrk as SAS.Workspace
  set wrk = connectWorkspaceManager(host, "", "", True)
  
    
'
' Use the connection to submit a program:
'
  call submit_program(wrk)
  call download_image(wrk)
  
'
' Close the connection to the workspace server
'
  wrk.close
  
'
' Connect to the metadata server:
'
  dim met as SASOMI.OMI
  set met = connectMetadataServer(host, "", "", True)
     
'
' Get the repositories as XML
'
' If not configured differently, there should be a 'foundation'
' repository.
'
  dim rc as Long
  dim reps_xml as String
  rc = met.GetRepositories(reps_xml, 0, "")
  
  msgBox (reps_xml)

end sub



sub submit_program(wrk as SAS.Workspace)

  dim prog as String
  
  prog = "ods listing;"
  prog = prog & "proc means"
  prog = prog & "  data=sashelp.cars;"
  prog = prog & "run;"
  
  wrk.LanguageService.Submit (prog)
  
  dim log as String
  dim buf as String
  
  do
    buf = wrk.LanguageService.FlushLog(1024)
    log = log & buf
  loop while len(buf) = 1024
  
  dim list as String
  
  do
    buf = wrk.LanguageService.FlushList(1024)
    list = list & buf
    'list = wrk.LanguageService.FlushList(10000)
  loop while len(buf) = 1024
  
  msgBox (log )
  msgBox (list)


end sub

sub download_image(wrk as SAS.Workspace)

  dim prog as String
  
  
  prog = "ods graphics / imagename='hist';" ' Apparently, the lenght of the given imagename cannot be longer than 7 characters!
  prog = prog & "ods listing gpath='/tmp';"
  prog = prog & "proc sgplot data=sashelp.cars;"
  prog = prog & "  histogram msrp;"
  prog = prog & "  density   msrp;"
  prog = prog & "run;"
  
' Create /tmp/hist.png on Server:
  wrk.LanguageService.Submit (prog)
  
  dim assignedName as String
  dim fref as SAS.fileref
  set fref = wrk.FileService.AssignFileref("img", "DISK", "/tmp/hist.png", "", assignedName)
' msgBox assignedName ' assignedName becomes IMG

  dim str as SAS.BinaryStream
    
  set str = fref.OpenBinaryStream(StreamOpenModeForReading)
  dim binData() as Byte
  
  open "c:\temp\img_from_sas.png" For Binary Access Write as #1
  do
    str.read 1024, binData
    
    put #1, , binData
    
  ' msgBox "len bytes = " & UBound(binData) - LBound(binData) + 1
    
  loop while ubound(bindata) - lbound(bindata) + 1 >= 1024
  
  close #1
  str.close
  
  wrk.fileService.deassignFileref assignedName
  
  msgBox "Image was created and downloaded"
end sub


function connectWorkspaceManager(srv as String, usr as String, pwd as String, use_kerberos as Boolean) as SAS.Workspace
' 8591 is the default Workspace server port:
  set connectWorkspaceManager = connectServerGeneric(srv, usr, pwd, use_kerberos, 8591, "440196d4-90f0-11d0-9f41-00a024bb830c")
end function


function connectMetadataServer(srv as String, usr as String, pwd as String, use_kerberos as Boolean) as SASOMI.OMI
'
' Return an instance of the Open Metadata Interface
'
' 8561 is the default Metaserver port
  set connectMetadataServer = connectServerGeneric(srv, usr, pwd, use_kerberos, 8561, "0217e202-b560-11db-ad91-001083ff6836")
end function


function connectServerGeneric(srv as String, usr as String, pwd as String, use_kerberos as Boolean, port as Long, class_id as String) as Variant

  dim def as new SASObjectManager.ServerDef

' ObjectFactory and ObjectFactorMulti2 provide the same methods,
' yet ObjectFactoryMulti2 allows to create multiple instances of
' the class within the same process. Thus, pooling is possible:
  dim fct as new SASObjectManager.ObjectFactoryMulti2
' dim fct as new SASObjectManager.ObjectFactory
  
  def.MachineDNSName = srv
 
' 
' Define protocol used to connect to server.
' 
' The type library defines constants for the three possible values 0, 1 and 2:
' 
' def.Protocol = ProtocolCom     '  value 0
' def.Protocol = ProtocolCorba   '  value 1
  def.Protocol = ProtocolBridge  '  value 2
 
  
' Identify requested server by class id.
' use
'    proc iomoperate;
'      list types;
'    quit;
' to determine class id.
'
'
' In my tests, the explicit setting of the class identifier was not needed
' for a workspace manager. 
'
  def.classIdentifier = class_id
   
  def.port = port
  
  if use_kerberos then
     def.BridgeSecurityPackage = "Negotiate"
  end if
  
  set connectServerGeneric = fct.CreateObjectByServer("tq84_test", True, def, usr, pwd)

end function
