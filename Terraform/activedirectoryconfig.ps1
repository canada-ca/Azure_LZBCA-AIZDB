# Please run this script on the 1st and primary domain controller once they are up and running in Azure; this must be run first to setup the initial forest and domain azure.local before other DCs are setup - 

Install-WindowsFeature -IncludeAllSubFeature RSAT
Add-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName "azure.local" -DomainMode Win2012R2 -ForestMode Win2012R2 -DatabasePath "c:\NTDS" -SysvolPath "c:\SYSVOL" -LogPath "c:\Logs" -DomainNetbiosName "azure" -NoRebootOnCompletion -Force
