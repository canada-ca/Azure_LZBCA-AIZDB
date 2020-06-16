# Please run this script on the 2nd domain controller once they are up and running in Azure; you have to run activedirectoryconfig.ps1 on the 1st domain controller otherwise the forest and domain azure.local will not be installed; this script simply joins the existing domain - 

Install-WindowsFeature -IncludeAllSubFeature RSAT
Add-WindowsFeature AD-Domain-Services
