
$wmidiskblock = `
{
Param($servername = "LocalHost")
Get-WmiObject -ComputerName $servername -Class win32_logicaldisk |  where {$_.DriveType -eq '3' -and $_.DeviceID -eq 'G:' } | 
ForEach-Object `
        {
            Get-ChildItem ("\\" + $servername + "\G$" + "\LOCALRW") -Recurse
        } |  `
        Where-Object { ($_.PSIsContainer -eq $true) -and ( $_.Name -eq "Monika")} | `
        Select name, FullName 
}


Import-Csv .\test2.txt | `
 #Start all jobs
ForEach-Object `
{
$servername = $_.computername
   #Start-Job -scriptblock $wmidiskblock  -ArgumentList $servername
   $servername
   Invoke-Command -computername $servername -ScriptBlock $wmidiskblock -ArgumentList $servername -AsJob
}


Get-Job | Wait-Job
Get-Job | Receive-Job




