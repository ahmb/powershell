# This function can perform sls / select-string / grep functionality on piped objects which are converted to strings

Function slss($x, $context = @(1,1))

{
 foreach($a in $input)

  { $a | out-string -stream | select-string $x -context $context }

} #end function slss

<#
=======
Example:
========
PS C:\> get-service | slss ds
Stopped  AppIDSvc           Application Identity                  
Running  DsmSvc             Device Setup Manager                  
Stopped  DsRoleSvc          DS Role Server                        
Stopped  hidserv            Human Interface Device Access         
Stopped  KdsSvc             Microsoft Key Distribution Service    
Stopped  lltdsvc            Link-Layer Topology Discovery Mapper  
Running  LPDSVC             LPD Service                           
Running  NTDS               Active Directory Domain Services      
Stopped  SCardSvr           Smart Card                            
Running  vds                Virtual Disk                          
Stopped  WDSServer          Windows Deployment Services Server    
#>
