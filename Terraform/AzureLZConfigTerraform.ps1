# Azure Landing Zone Base Cloud Architecture - Architecture infonuagique zone d'atterrissage de base
# Script author - tarek.ali@canada.ca

# paths and files
$current_dir = Convert-Path .
$log = "Current working directory - ", $current_dir
Write-Output $log

$current_date = Get-Date -Format "yyyyMMdd"
$log = "Current date time stamp - ", $current_date
Write-Output $log

$logfile = $current_dir, "\", "AzureLZConfigTerraform", $current_date, ".txt"
$logfile = [system.String]::Join("", $logfile)
$log = "Logfile set to - ", $logfile, "`n"
Clear-Content $logfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

# set env vars - should be tenant id assigned by SSC, e.g. 123gc
$env = "tenantid"

# define local domain based on env - customizable by user
$localdomain = $env, ".local"
$localdomain = [system.String]::Join("", $localdomain)

$inputfile = $current_dir, "\", "AzureLZConfigTerraform.csv"
$inputfile = [system.String]::Join("", $inputfile)
$log = "inputfile set to - ", $inputfile, "`n"
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
$keyfile = $current_dir, "\", "keys.csv"
$keyfile = [system.String]::Join("", $keyfile)
$log = "keyfile set to - ", $keyfile, "`n"
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

# prepare output files - 

$rgfile = $current_dir, "\", "rgs.tf"
$rgfile = [system.String]::Join("", $rgfile)
$log = "outputfile set to - ", $rgfile, "`n"
Clear-Content $rgfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$vnetfile = $current_dir, "\", "vnets.tf"
$vnetfile = [system.String]::Join("", $vnetfile)
$log = "outputfile set to - ", $vnetfile, "`n"
Clear-Content $vnetfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$snetfile = $current_dir, "\", "snets.tf"
$snetfile = [system.String]::Join("", $snetfile)
$log = "outputfile set to - ", $snetfile, "`n"
Clear-Content $snetfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$peerfile = $current_dir, "\", "peering.tf"
$peerfile = [system.String]::Join("", $peerfile)
$log = "outputfile set to - ", $peerfile, "`n"
Clear-Content $peerfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$backendfile = $current_dir, "\", "config.tf"
$backendfile = [system.String]::Join("", $backendfile)
$log = "backendfile set to - ", $backendfile, "`n"
Clear-Content $backendfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$terraformfile = $current_dir, "\", "terraform.tf"
$terraformfile = [system.String]::Join("", $terraformfile)
$log = "terraform file set to - ", $terraformfile, "`n"
Clear-Content $terraformfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$remoteblobfile = $current_dir, "\", "terraform_remote_blob.tf"
$remoteblobfile = [system.String]::Join("", $remoteblobfile)
$log = "remoteblobfile set to - ", $remoteblobfile, "`n"
Clear-Content $remoteblobfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$remotebackendfile = $current_dir, "\", "terraform_remote_backend.tf_"
$remotebackendfile = [system.String]::Join("", $remotebackendfile)
$log = "remotebackendfile set to - ", $remotebackendfile, "`n"
Clear-Content $remotebackendfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

# temp file to store temporary data
$tempfile = $current_dir, "\", "tempdata.txt"
$tempfile = [system.String]::Join("", $tempfile)
$log = "temp data file set to - ", $tempfile, "`n"
Clear-Content $tempfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$ipfile = $current_dir, "\", "ip.tf"
$ipfile = [system.String]::Join("", $ipfile)
$log = "ipfile set to - ", $ipfile, "`n"
Clear-Content $ipfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$nicfile = $current_dir, "\", "nic.tf"
$nicfile = [system.String]::Join("", $nicfile)
$log = "nicfile set to - ", $nicfile, "`n"
Clear-Content $nicfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$sdnfile = $current_dir, "\", "sdn.tf"
$sdnfile = [system.String]::Join("", $sdnfile)
$log = "sdnfile set to - ", $sdnfile, "`n"
Clear-Content $sdnfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$linuxvmfile = $current_dir, "\", "linuxvm.tf"
$linuxvmfile = [system.String]::Join("", $linuxvmfile)
$log = "vmfile set to - ", $linuxvmfile, "`n"
Clear-Content $linuxvmfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$windowsvmfile = $current_dir, "\", "windowsvm.tf"
$windowsvmfile = [system.String]::Join("", $windowsvmfile)
$log = "vmfile set to - ", $windowsvmfile, "`n"
Clear-Content $windowsvmfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$fortinetvmfile = $current_dir, "\", "fortinet.tf"
$fortinetvmfile = [system.String]::Join("", $fortinetvmfile)
$log = "fortinetvmfile set to - ", $fortinetvmfile, "`n"
Clear-Content $fortinetvmfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$fortinetdatafile = $current_dir, "\", "fortinetdata.tf"
$fortinetdatafile = [system.String]::Join("", $fortinetdatafile)
$log = "fortinet data config var file set to - ", $fortinetdatafile, "`n"
Clear-Content $fortinetdatafile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$vmextfile = $current_dir, "\", "vmextensions.tf"
$vmextfile = [system.String]::Join("", $vmextfile)
$log = "vmfile set to - ", $vmextfile, "`n"
Clear-Content $vmextfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$availabilitysetfile = $current_dir, "\", "availabilityset.tf"
$availabilitysetfile = [system.String]::Join("", $availabilitysetfile)
$log = "availabilitysetfile set to - ", $availabilitysetfile, "`n"
Clear-Content $availabilitysetfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$readmefile = $current_dir, "\", "installation_notes.md"
$readmefile = [system.String]::Join("", $readmefile)
$log = "readmefile set to - ", $readmefile, "`n"
Clear-Content $readmefile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$lawfile = $current_dir, "\", "law.tf"
$lawfile = [system.String]::Join("", $lawfile)
$log = "lawfile set to - ", $lawfile, "`n"
Clear-Content $lawfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$lbfile = $current_dir, "\", "lb.tf"
$lbfile = [system.String]::Join("", $lbfile)
$log = "lbfile set to - ", $lbfile, "`n"
Clear-Content $lbfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$f5file = $current_dir, "\", "f5.tf"
$f5file = [system.String]::Join("", $f5file)
$log = "f5file set to - ", $f5file, "`n"
Clear-Content $f5file
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$routefile = $current_dir, "\", "routes.tf"
$routefile = [system.String]::Join("", $routefile)
$log = "routefile set to - ", $routefile, "`n"
Clear-Content $routefile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$nsgfile = $current_dir, "\", "nsgs.tf"
$nsgfile = [system.String]::Join("", $nsgfile)
$log = "nsgfile set to - ", $nsgfile, "`n"
Clear-Content $nsgfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

# resource write flag for fortinet
$fortinetflag = 0

# resource write flag for azure mkt place
$azuremktflag = 0 # for fortinet
$azuremktflag2 = 0 # for f5 lbs

# create and populate post config script for active directory dc1
$activedirectoryconfig = $current_dir, "\", "activedirectoryconfig.ps1"
$activedirectoryconfig = [system.String]::Join("", $activedirectoryconfig)
$log = "activedirectoryconfig set to - ", $activedirectoryconfig, "`n"
Clear-Content $activedirectoryconfig
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
$log = "# Please run this script on the 1st and primary domain controller once they are up and running in Azure; this must be run first to setup the initial forest and domain ", $localdomain ," before other DCs are setup - `n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig
$log = "Install-WindowsFeature -IncludeAllSubFeature RSAT"
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig
$log = "Add-WindowsFeature AD-Domain-Services"
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig
$log = "Install-ADDSForest -DomainName `"", $localdomain,"`" -DomainMode Win2012R2 -ForestMode Win2012R2 -DatabasePath `"c:\NTDS`" -SysvolPath `"c:\SYSVOL`" -LogPath `"c:\Logs`" -DomainNetbiosName `"",$env,"`" -NoRebootOnCompletion -Force"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig  

# create and populate post config script for active directory dc2
$activedirectoryconfig2 = $current_dir, "\", "activedirectoryconfig2.ps1"
$activedirectoryconfig2 = [system.String]::Join("", $activedirectoryconfig2)
$log = "activedirectoryconfig set to - ", $activedirectoryconfig2, "`n"
Clear-Content $activedirectoryconfig2
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
$log = "# Please run this script on the 2nd domain controller once they are up and running in Azure; you have to run activedirectoryconfig.ps1 on the 1st domain controller otherwise the forest and domain ", $localdomain ," will not be installed; this script simply joins the existing domain - `n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig2
$log = "Install-WindowsFeature -IncludeAllSubFeature RSAT"
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig2
$log = "Add-WindowsFeature AD-Domain-Services"
$log | Out-File -Append -Force -Encoding utf8 -FilePath $activedirectoryconfig2

# script to generate and accept terms for azure marketplace licenses - to be run on deployment host
$azuremarketplace = $current_dir, "\", "azuremarketplace.ps1"
$azuremarketplace = [system.String]::Join("", $azuremarketplace)
$log = "activedirectoryconfig set to - ", $azuremarketplace, "`n"
Clear-Content $azuremarketplace
Write-Output $log

# process key file data
foreach($line in [System.IO.File]::ReadLines($keyfile))
{
    $log = "Processing - ", $line
    $log = [system.String]::Join("", $log)
    #Write-Output $log
    #$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    # split lines by = delimiter
    $data = $line -split ","
    $log = "Extracted 1st data - ", $data[0]
    $log = [system.String]::Join("", $log)
    #Write-Output $log
    #$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    # split lines by # delimiter
    $data2 = $line -split "#"

    # extract and write client_id data
    if ($data[0] -eq "client_id" ) {
        $log = "`n", "client_id detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $client_id = $data[1]
        $log = "`n", "client_id value - ", $client_id
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }

    # extract and write client_secret data
    if ($data[0] -eq "client_secret" ) {
        $log = "`n", "client_secret detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $client_secret = $data[1]
        $log = "`n", "client_secret value - ", $client_secret
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }

    # extract and write tenant_id data
    if ($data[0] -eq "tenant_id" ) {
        $log = "`n", "tenant_id detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $tenant_id = $data[1]
        $log = "`n", "tenant_id value - ", $tenant_id
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }

} # foreach($line in [System.IO.File]::ReadLines($keyfile))


# process config file data
foreach($line in [System.IO.File]::ReadLines($inputfile))
{
    $log = "Processing - ", $line
    $log = [system.String]::Join("", $log)
    #Write-Output $log
    #$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    # split lines by = delimiter
    $data = $line -split ","
    $log = "Extracted 1st data - ", $data[0]
    $log = [system.String]::Join("", $log)
    #Write-Output $log
    #$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    # split lines by # delimiter
    $data2 = $line -split "#"

    # extract and write location data
    if ($data[0] -eq "location" ) {
        $log = "`n", "location detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $location = $data[1]
        $log = "`n", "location value - ", $location
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }

    # extract and write region data
    if ($data[0] -eq "region" ) {
        $log = "`n", "region detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $region = $data[1]
        $log = "`n", "region value - ", $region
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }

    # extract and write subscription data
    if ($data[0] -eq "subscription" ) {
        $log = "`n", "subscription detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $subscription = $data[1]
        $log = "`n", "subscription value - ", $subscription
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # assemble subscription and provider data
        $version_tag = "   version= `"1.36.0`""
        $data[1] = $data[1] -replace " ", ""
        $alias_tag = "   alias = ", "`"", $data[1], "`""
        $alias_tag = [system.String]::Join("", $alias_tag)
        $subdata = $data[2] -split "#"
        $subscription_id_tag = "   subscription_id = ", "`"", $subdata[0], "`""
        $subscription_id_tag = [system.String]::Join("", $subscription_id_tag)
        $client_id_tag = "   client_id = ", "`"", $client_id, "`""
        $client_id_tag = [system.String]::Join("", $client_id_tag)
        $client_secret_tag = "   client_secret = ", "`"", $client_secret, "`""
        $client_secret_tag = [system.String]::Join("", $client_secret_tag)
        $tenant_id_tag = "   tenant_id = ", "`"", $tenant_id, "`""
        $tenant_id_tag = [system.String]::Join("", $tenant_id_tag)

        $subs = "provider `"azurerm`" {",  $version_tag, $alias_tag, $subscription_id_tag, $client_id_tag, $client_secret_tag, $tenant_id_tag, "}", "`n"
        $subs | Out-File -Append -Force -Encoding utf8 -FilePath $backendfile

        # write script to modify subscriptions to accept azure marketplace licenses for fortinet firewall
        if ($azuremktflag -eq 0) {
            $log = "# Please run these commands to modify core subscription to accept azure marketplace licenses for fortinet firewall"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            $log = "# You will be prompted to login first via powershell to reach the tenant; please run this on a deployment host with unblocked ports [not ssc laptop]"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            $log = "`n`nConnect-AzAccount`n`n"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            $azuremktflag = 1
        } #        if ($azuremktflag = 0) {

        $log = "Set-AzContext -SubscriptionId `"", $subdata[0], "`"`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
        $log = "Get-AzMarketplaceTerms -Publisher fortinet -Product fortinet_fortigate-vm_v5 -Name fortinet_fg-vm `| Set-AzMarketplaceTerms -Accept`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace

    } #    if ($data[0] -eq "subscription" ) {

    # extract and write provider version data
    if ($data[0] -eq "provider" ) {
        $log = "`n", "provider version detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # write each provider version individually to temp file
        $log = $data[1], " = `"`~`> ", $data[2], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile

        # if no additional rules exist in this group write out final nsg custom file and clear temp rule file
        if ($data[3] -eq "no") {
            $log = "terraform {`nrequired_providers {"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $terraformfile

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $terraformfile
            }
            Clear-Content $tempfile

            $log = "}`n}`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $terraformfile
        } #        if ($data[3] -eq "no") {

    } #    if ($data[0] -eq "provider" ) {
        
    # detect and process resource group tags
    if ($data[0] -eq "rg-tags") {
        $log = "`n", "resource group tags detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # assemble tags from delimited field
        $rgtags = $data[1] -split ";"
        $rgtags = $rgtags -replace "``","`""
        $rgtags = "`n","tags = {",$rgtags,"}","`n"
    }

    # detect and process resource groups
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rg")) {
        $log = "`n", "resource group detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $rg = $data[0]
        $rg_short = $rg -split "-"
        $log = "`n", "rg value - ", $rg
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # write resource group var data
        $log = "resource `"azurerm_resource_group`" `"", $rg ,"`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile
        $log = "name     = `"", $rg, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile

        # select provider for subscription
        $provider = $data[1] -split "#"
        $provider[0] = $provider[0] -replace " ", ""
        $log = "provider = azurerm.", $provider[0]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile

        $rgtags | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $rgfile

    } #     if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rg")) {

    # detect and process all tags for all objects except resource groups above
    if ($data[0] -eq "all-tags") {
        $log = "`n", "resource group tags detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # assemble tags from delimited field
        $alltags = $data[1] -split ";"
        $alltags = $alltags -replace "``","`""
        $alltags = "`n","tags = {",$alltags,"}","`n"
    }

    # detect and process vnets
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "-vnet")) {
        $log = "`n", "vnet detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $vnet = $data[0]
        $log = "`n", "vnet value - ", $vnet
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write vnet var data
        $log = "resource `"azurerm_virtual_network`" `"", $vnet, "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $log = "name     = `"", $vnet, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $log = "address_space = [`"", $data[1], "`"]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $subname = $data[3] -split "#"
        $subname[0] = $subname[0] -replace " ", ""
        $log = "provider = azurerm.", $subname[0]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile

        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vnetfile
    } #     if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "-vnet")) {

    # detect and process snets
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "-snet")) {
        $log = "`n", "snet detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        $snet = $data[0]
        $log = "`n", "snet value - ", $snet
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write snet var data
        $log = "resource `"azurerm_subnet`" `"", $snet, "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        $log = "name     = `"", $snet, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        $log = "address_prefix = `"", $data[1], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        $log = "virtual_network_name = azurerm_virtual_network.", $data[3], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        if ($data[6] -ne "none") {
            $log = "route_table_id = azurerm_route_table.", $data[6], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        }
        $subname = $data[4] -split "#"
        $subname[0] = $subname[0] -replace " ", ""
        $log = "provider = azurerm.", $subname[0]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        if ($data[7] -ne "none") {
            $log = "network_security_group_id = azurerm_network_security_group.", $data[7], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        }

        # tags not supported on snets
        #$alltags | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile

        # detect snet nsg associations
        if ($data[7] -ne "none") {
            $log = "`n", "azurerm_subnet_network_security_group_association detected - ", $data[7]
            $log = [system.String]::Join("", $log)
            Write-Output $log
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
            $log = "resource `"azurerm_subnet_network_security_group_association`" `"", $data[7], "-", $data[0], "`" `{"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
            $log = "subnet_id = azurerm_subnet.", $data[0], ".id" 
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
            $log = "network_security_group_id = azurerm_network_security_group.", $data[7], ".id" 
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
            $log = "provider = azurerm.", $subname[0]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
            $log = "}","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $snetfile
        } #        if ($data[7] -ne "none") {
        
    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "-snet")) {

    # detect and process peering
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 4) -eq "-gwp")) {
        $log = "`n", "peering gwp detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "peering gwp value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write peering gwp data
        $log = "resource `"azurerm_virtual_network_peering`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $data[2] = $data[2] -replace " ", ""
        $log = "provider = azurerm.", $data[2]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "resource_group_name = azurerm_resource_group.", $data[1], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "virtual_network_name = azurerm_virtual_network.", $data[3], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "remote_virtual_network_id = azurerm_virtual_network.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile

        # settings
        $log = "allow_virtual_network_access = `"", $data[5].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "allow_forwarded_traffic = `"", $data[7].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "allow_gateway_transit = `"", $data[8].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "use_remote_gateways = `"", $data[9].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile

        # tags not supported in peering
        #$alltags | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $peerfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 4) -eq "-gwp")) {

    # detect and process route tables 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rt")) {
        $log = "`n", "route tables detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "route tables value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # settings - write out existing specified route tables rule into temp rule file
        $log = "`nroute {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "name = `"", $data[3], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "address_prefix = `"", $data[4], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "next_hop_in_ip_address = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "next_hop_type = `"", $data[6], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile

        # if no additional rules exist in this group write out final route tables custom file and clear temp rule file
        if ($data[9] -eq "no") {

            # write route tables data
            $log = "resource `"azurerm_route_table`" `"", $data[0], "`" {","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $log = "name = `"", $data[0], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $log = "resource_group_name = azurerm_resource_group.", $data[1], ".name"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $log = "location = `"", $data[2], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $data[15] = $data[15] -replace " ", ""
            $log = "provider = azurerm.", $data[15]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $log = "disable_bgp_route_propagation = false"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            }
            Clear-Content $tempfile

            # tags supported in route tables
            $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
            $log = "}","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile

        } #        if ($data[9] -eq "no") {

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rt")) {

    # detect and process route tables and subnet associations
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rt") -and ($data[4] -eq "yes")) {
        Clear-Content $tempfile
        $log = "`n", "route tables and subnet associations detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "route tables and subnet associations value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # associate subnet with route table; concatenate table and snet with - delimiter
        $temp = $data[0], "-", $data[2]
        $temp = [system.String]::Join("", $temp)
        $log = "resource `"azurerm_subnet_route_table_association`" `"", $temp, "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
        $log = "subnet_id = azurerm_subnet.", $data[2], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
        $log = "route_table_id = azurerm_route_table.", $data[0], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
        $data[5] = $data[5] -replace " ", ""
        $log = "provider = azurerm.", $data[5]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $routefile

        Clear-Content $tempfile
    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-rt")) {

    # detect and process storage for remote state management
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -like "*store*")) {
        $log = "`n", "storage detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "storage value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # force lowercase for storage entity names
        $data[0] = $data[0].tolower()
        $data[1] = $data[1].tolower()

        # write storage account data
        $log = "resource `"azurerm_storage_account`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "name     = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "account_tier             = `"standard`"  `naccount_replication_type = `"LRS`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "lifecycle {`nprevent_destroy = true`n}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile


        # write storage blob data
        $log = "resource `"azurerm_storage_container`" `"", $data[1], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "name     = `"", $data[1], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "storage_account_name  = azurerm_storage_account.", $data[0] ,".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "container_access_type = `"private`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile
        $log = "lifecycle {`nprevent_destroy = true`n}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile

        # retrieve blob access key
        #$log = "`n`noutput `"remotecontainerkey`"`{`nvalue = `"`$`{azurerm_storage_account.scsccsatterraform.primary_access_key`}`"`n`}"
        #$log = [system.String]::Join("", $log)
        #$log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile

        # end of file
        $log = "`n`n`}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remoteblobfile

        # write backend declaration file
        $log = "terraform `{`nbackend `"azurerm`" `{"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile
        $log = "storage_account_name  = ", $data[0]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile
        $log = "container_name  = ", $data[1]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile
        $log = "key                   = `"azure_terraform.tfstate`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile
        # please provide key in file; placeholder provided
        $log = "access_key            = `"t3qbsTcK9h9um2qjL04khkDtLrDaCx1d9hp5ViZd1u2bGYJ0bCMVw0OY0WzoXvHctg0YiOt6BD3qDsXjvpv9+g==`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile
        $log = "`}`n`}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $remotebackendfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -like "*store*")) {

    # detect and process nsg network security group
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 4) -eq "-nsg")) {
        $log = "`n", "network security group detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "network security group value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # settings - write out existing specified nsg rule into temp rule file
        $log = "`nsecurity_rule {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "name = `"", $data[4], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "priority = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "direction = `"", $data[6], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "access = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "protocol = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "source_port_range = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        #$log = "destination_port_range = `"", $data[10], "`""
        #$log = [system.String]::Join("", $log)
        #$log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        # support single or multiple destination_port_range
        if ($data[10] -like "*;*") {
            $data[10] = $data[10] -replace ";", "`",`""
            $log = "destination_port_ranges = [`"", $data[10], "`"]"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } else {
            $log = "destination_port_range = `"", $data[10], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        }
        # support single or multiple source_address_prefixes
        if ($data[11] -like "*;*") {
            $data[11] = $data[11] -replace ";", "`",`""
            $log = "source_address_prefixes = [`"", $data[11], "`"]"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } else {
            $log = "source_address_prefix = `"", $data[11], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        }
        $log = "destination_address_prefix = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "description = `"", $data[13], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile


        # if no additional rules exist in this group write out final nsg custom file and clear temp rule file
        if ($data[14] -eq "no") {

            # write nsg network security group data
            $log = "resource `"azurerm_network_security_group`" `"", $data[0], "`" {","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            $log = "name = `"", $data[0], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            $log = "location = `"", $location, "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            $data[3] = $data[3] -replace " ", ""
            $log = "provider = azurerm.", $data[3]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            }
            Clear-Content $tempfile

            # tags supported in nsg
            $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile
            $log = "}","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nsgfile

        } #        if ($data[14] -eq "no") {


    } #     if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "-nsg")) {

    # detect and process ip address
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*-pip*")) {
        $log = "`n", "ip address detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "ip address value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write ip address data
        $log = "resource `"azurerm_public_ip`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile
        # save assigned f5 vm names and primary resource group used
        if ($data[0] -like "*f5vm01*") {
            $f5vm1_vm_name = $data[0]
            $f5vm1_rg_name = $data[2]
        }
        if ($data[0] -like "*f5vm02*") {
            $f5vm2_vm_name = $data[0]
            $f5vm2_rg_name = $data[2]
        }
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile

        # settings
        $log = "allocation_method = `"", $data[4], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile

        # tags supported in ip
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $ipfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*-pip*")) {
    
    # detect and process nic 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*-nic*")) {
        $log = "`n", "nic detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "nic value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write nic address data
        $log = "resource `"azurerm_network_interface`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        # save assigned f5 nic names
        if ($data[0] -like "*F5VM01*") {
            $f5vm01ext_nic_name = $data[0]
        }
        if ($data[0] -like "*F5VM01*") {
            $f5vm01int_nic_name = $data[0]
        }
        if ($data[0] -like "*F5VM02*") {
            $f5vm02ext_nic_name = $data[0]
        }
        if ($data[0] -like "*F5VM02*") {
            $f5vm02int_nic_name = $data[0]
        }
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        if ($data[4] -ne "none") {
            $log = "network_security_group_id = azurerm_network_security_group.", $data[4], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        }
        $log = "enable_ip_forwarding = `"", $data[10].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "enable_accelerated_networking = `"", $data[11].tolower(), "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "dns_servers = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        if ($data[12] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
        $log = "depends_on = [azurerm_lb_backend_address_pool.", $data[14], "]"
        $log = [system.String]::Join("", $log)
        if ($data[14] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile

        # settings - primary
        $log = "ip_configuration {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "name = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "subnet_id = azurerm_subnet.", $data[6], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "private_ip_address = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        if ($data[7] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
        $log = "private_ip_address_allocation = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "public_ip_address_id = azurerm_public_ip.", $data[9], ".id"
        $log = [system.String]::Join("", $log)
        if ($data[9] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
        $log = "primary = `"", $data[13].tolower(), "`""
        $log = [system.String]::Join("", $log)
        if ($data[13] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
        $log = "}`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile

        # settings - secondary
        if ($data[15] -ne "none") { 
            $log = "ip_configuration {"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "name = `"secondary`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "subnet_id = azurerm_subnet.", $data[15], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "private_ip_address_allocation = `"", $data[16], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "private_ip_address = `"", $data[17], "`""
            $log = [system.String]::Join("", $log)
            if ($data[17] -ne "none") { $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile }
            $log = "}`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        } #        if ($data[15] -ne "none") { 

        # process vip data
        if ($data[18] -ne "none") {
            $log = "ip_configuration {"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "name = `"", $data[18], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "subnet_id = azurerm_subnet.", $data[6], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "private_ip_address = `"", $data[20], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "private_ip_address_allocation = `"static`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            # disable public ip
            #$log = "public_ip_address_id = azurerm_public_ip.", $data[9], ".id"
            #$log = [system.String]::Join("", $log)
            #$log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "primary = `"false`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
            $log = "}","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        }

        # tags supported in nic
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $nicfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*-nic*")) {
    
    # detect and process availabilityset 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -3) -eq "-as")) {
        $log = "`n", "availabilityset detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "availabilityset value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write availabilityset data
        $log = "resource `"azurerm_availability_set`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile

        # settings
        $log = "platform_fault_domain_count = `"", $data[4], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "platform_update_domain_count = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $temp = $data[6].tolower()
        $log = "managed = `"", $temp, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile

        # tags supported
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $availabilitysetfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 16) -eq "-as")) {
    
    # detect and process sdnapp 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -4) -eq "-sdn")) {
        $log = "`n", "sdnapp detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "sdnapp value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write sdnapp data
        $log = "provider `"azuread`" `{
version = `"=0.7`"
`}"          
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile

        $log = "`nresource `"azuread_application`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "available_to_other_tenants = false
oauth2_allow_implicit_flow = false
}"        
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "`nresource `"random_password`" `"password`" {
length  = 33
special = true
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "`nresource `"azuread_application_password`" `"",$data[0],"pwd`" {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "application_object_id = azuread_application.",$data[0],".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "value          = random_password.password.result
# we can specify direct value as well: value          = `"VT=yKgbSanXhyz@%nL8Hpe+Mfay_DIV#`"
end_date       = `"2021-01-01T01:02:03Z`"
}

output `"client_secret`" {
description = `"Client Secret`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        # commenting out password retrieval for now due to self referential error
        $log = "value       = azuread_application_password.",$data[0],"pwd.value"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $sdnfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -4) -eq "-sdn")) {

    # detect and process linux vms 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "linux")) {
        $log = "`n", "linux vm detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "linux vm value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write vm address data
        $log = "resource `"azurerm_virtual_machine`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "network_interface_ids = [azurerm_network_interface.", $data[6], ".id]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "vm_size = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "delete_data_disks_on_termination = `"true`"
delete_os_disk_on_termination    = `"true`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

        $log = "storage_os_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "name = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "
caching = `"ReadWrite`"
create_option = `"FromImage`"
managed_disk_type = `"Premium_LRS`"
}
storage_image_reference {
publisher = `"Canonical`"
offer = `"UbuntuServer`"
sku = `"16.04.0-LTS`"
version = `"latest`"
}
os_profile_linux_config {
disable_password_authentication = false
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

        # settings
        $log = "os_profile {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "computer_name = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "admin_username = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "admin_password = `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

        # tags supported in vm
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $linuxvmfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "linux")) {
    
    # detect and process windows vms 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "windows")) {
        $log = "`n", "windows vm detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "windows vm value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write vm general data
        $log = "resource `"azurerm_virtual_machine`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "network_interface_ids = [azurerm_network_interface.", $data[6], ".id]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "availability_set_id = azurerm_availability_set.", $data[13], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "vm_size = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "delete_data_disks_on_termination = `"true`"
delete_os_disk_on_termination    = `"true`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        # settings
        $log = "os_profile {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "computer_name = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "admin_username = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "admin_password = `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "
storage_image_reference {
publisher = `"MicrosoftWindowsServer`"
offer     = `"WindowsServer`"
sku       = `"2016-Datacenter`"
version   = `"latest`"
}
`n
os_profile_windows_config {
provision_vm_agent = true
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "storage_os_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "name = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "caching       = `"ReadWrite`"
create_option = `"FromImage`"
os_type       = `"Windows`"
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "storage_data_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "name = `"", $data[14], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "lun           = 0
caching       = `"None`"
create_option = `"Empty`"
disk_size_gb  = `"10`"
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

        # tags supported in vm
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $windowsvmfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "windows")) {

    # detect and process fortinet vm01 config file
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "fg1_custom_data")) {
        $log = "`n", "fg1_custom_data detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "fg1_custom_data values detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = $data[1]
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = $data[2]
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # fix incorrect characters
        $data[2] = $data[2] -replace ";", ","
        $data[2] = $data[2] -replace "`"`"/`"`"", "`"/`""
        #$data[2] = $data[2] -replace "`"`"`"`$`{element", "`"`$`{element"
        #$data[2] = $data[2] -replace "prefix`), 1`)`}`"`"`"", "prefix`), 1`)`}`""

        # write data values to temp file 
        if ($data[2] -like "*azurerm_network_interface*" -or $data[2] -like "*element*" -or $data[2] -like "*cidrhost*") {
            $log = $data[1], " = ", $data[2]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } else {
            $log = $data[1], " = `"", $data[2], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        }

        # if no additional fg1_custom_data in this group write out final fg1_custom_data file and clear temp rule file
        if ($data[3] -eq "no") {

            $log = "`n", "fg1_custom_data end of rules detected - ", $line
            $log = [system.String]::Join("", $log)
            Write-Output $logfile
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    
            $log = "`data `"template_file`" `"fg1_custom_data`" {
template = `"`$`{path.module`}`/FG/customdata.tpl`"
vars = {"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile
            }
            Clear-Content $tempfile

            $log = "}
}","`n"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile

        } #         if ($data[3] -eq "no") {

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "fg1_custom_data")) {

    # detect and process fortinet vm02 config file
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "fg2_custom_data")) {
        $log = "`n", "fg2_custom_data detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "fg2_custom_data values detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = $data[1]
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = $data[2]
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

        # fix incorrect characters
        $data[2] = $data[2] -replace ";", ","
        $data[2] = $data[2] -replace "`"`"/`"`"", "`"/`""
        #$data[2] = $data[2] -replace "`"`"`"`$`{element", "`"`$`{element"
        #$data[2] = $data[2] -replace "prefix`), 1`)`}`"`"`"", "prefix`), 1`)`}`""

        # write data values to temp file 
        if ($data[2] -like "*azurerm_network_interface*" -or $data[2] -like "*element*" -or $data[2] -like "*cidrhost*") {
            $log = $data[1], " = ", $data[2]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } else {
            $log = $data[1], " = `"", $data[2], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        }

        # if no additional fg2_custom_data in this group write out final fg2_custom_data file and clear temp rule file
        if ($data[3] -eq "no") {

            $log = "`n", "fg2_custom_data end of rules detected - ", $line
            $log = [system.String]::Join("", $log)
            Write-Output $logfile
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    
            $log = "`data `"template_file`" `"fg2_custom_data`" {
template = `"`$`{path.module`}`/FG/customdata.tpl`"
vars = {"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile
            }
            Clear-Content $tempfile

            $log = "}
}","`n"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetdatafile

        } #         if ($data[3] -eq "no") {

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "fg2_custom_data")) {

    # detect and process fortinet vms 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[1] -like "*FGVM0*") -and ($data[11] -like "fortinet")) {
        $log = "`n", "fortinet vm detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "fortinet vm value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # declare market place resource once only
        if ($fortinetflag -eq 0) {
            $log = "resource `"azurerm_marketplace_agreement`" `"fortinet`" {
plan      = `"fortinet_fg-vm`"
publisher = `"fortinet`"
offer     = `"fortinet_fortigate-vm_v5`"
}`n`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
            $fortinetflag = 1
        } #        if ($fortinetflag = 0) {

        # write vm general data
        $log = "resource `"azurerm_virtual_machine`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $nics = $data[6] -split ";"
        $log = "network_interface_ids = [azurerm_network_interface.", $nics[0], ".id",", azurerm_network_interface.", $nics[1], ".id",", azurerm_network_interface.", $nics[2], ".id",", azurerm_network_interface.", $nics[3], ".id",", azurerm_network_interface.", $nics[4], ".id",", azurerm_network_interface.", $nics[5], ".id",", azurerm_network_interface.", $nics[6], ".id]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "primary_network_interface_id = azurerm_network_interface.", $data[15], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "availability_set_id = azurerm_availability_set.", $data[13], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "vm_size = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "delete_data_disks_on_termination = `"true`"
delete_os_disk_on_termination    = `"true`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        # settings
        $log = "os_profile {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "computer_name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "admin_username = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "admin_password = `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "custom_data = `"`$`{path.module`}`/FG`/", $data[16], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "
storage_image_reference {
publisher = `"fortinet`"
offer     = `"fortinet_fortigate-vm_v5`"
sku       = `"fortinet_fg-vm`"
version   = `"6.2.3`"
}
`n
plan {
name      = `"fortinet_fg-vm`"
publisher = `"fortinet`"
product   = `"fortinet_fortigate-vm_v5`"
}
`n
depends_on = [azurerm_marketplace_agreement.fortinet]
`n
os_profile_linux_config {
disable_password_authentication = false
}
"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "storage_os_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "name = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "caching       = `"ReadWrite`"
create_option = `"FromImage`"
os_type       = `"Linux`"
disk_size_gb  = `"2`"
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "storage_data_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "name = `"", $data[14], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "
lun           = 0
caching       = `"None`"
create_option = `"Empty`"
disk_size_gb  = `"30`"
}

boot_diagnostics {
enabled     = true
storage_uri = `"https`:`/`/scpccsalzdeploy.blob.core.windows.net`/`"
}
"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

        # tags supported in vm
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $fortinetvmfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*FGVM0*")) {
    
    # detect and process vm extensions
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "vmext")) {
        $log = "`n", "vm extensions detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "vm extensions value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write vm extensions data
        $log = "resource `"azurerm_virtual_machine_extension`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "virtual_machine_name = azurerm_virtual_machine.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "publisher            = `"Microsoft.Powershell`"
type                 = `"DSC`"
type_handler_version = `"2.77`"

settings = `<`<SETTINGS
{
`"WmfVersion`"`: `"latest`",
`"configuration`"`: `{
`"url`"`: `"https`:`/`/raw.githubusercontent.com`/canada-ca-terraform-modules`/terraform-azurerm-active-directory`/20190731.1`/DSC`/CreateADRootDC1.ps1.zip`",
`"script`"`: `"CreateADRootDC1.ps1`",
`"function`"`: `"CreateADRootDC1`"
},
`"configurationArguments`"`: `{"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"DomainName`"`: `"", $data[5], "`"`,"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"DnsForwarder`"`: `"", $data[6], "`"`,"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"DnsAlternate`"`: `"azurerm_network_interface.", $data[7], ".ip_configuration.0.private_ip_address`"`,"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"ReverseZoneObject`"`: `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`}
`}
SETTINGS
protected_settings = `<`<PROTECTED_SETTINGS
`{
`"configurationArguments`"`: `{
`"adminCreds`"`: `{"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"UserName`"`: `"", $data[9], "`"`,"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`"Password`"`: `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "`}
`}
`}
PROTECTED_SETTINGS"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile


        # tags not supported
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $vmextfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 5) -eq "vmext")) {
    
    # exclude comment lines
    if ($line.substring(0,1) -eq "#" ) {
        $log = "`n", "Comment line detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
    }
    
    # detect and process law - log analytics workspace
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "law")) {
        $log = "`n", "law - log analytics workspace - detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "law value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write law address data
        $log = "resource `"azurerm_log_analytics_workspace`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile

        $log = "sku = `"", $data[4], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $log = "retention_in_days = ", $data[5]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile

        # tags supported in law
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lawfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "law")) {

    # detect and process load balancer 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length - 3) -eq "-lb")) {
        $log = "`n", "load balancer detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "load balancer value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write lb data if no extra front end lines config required
        if ($data[11] -eq "no") {

            # write load balancer data
            $log = "resource `"azurerm_lb`" `"", $data[0], "`" {","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            $log = "name = `"", $data[0], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            $log = "location = `"", $location, "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            $data[3] = $data[3] -replace " ", ""
            $log = "provider = azurerm.", $data[3]
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            if ($data[4] -ne "null") {
                $log = "sku = `"", $data[4], "`""
                $log = [system.String]::Join("", $log)
                $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            } #            if ($data[4] -ne "null") {
            $log = "`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile

        } #        if ($data[11] -eq "no") {

        # write each frontend config individually to temp file
        $log = "frontend_ip_configuration {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        $log = "name = `"", $data[5], "`"" 
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        if ($data[7] -ne "null") {
            $log = "private_ip_address_allocation = `"", $data[7], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } #        if ($data[7] -ne "null") {
        if ($data[8] -ne "null") {
            $log = "private_ip_address = `"", $data[8], "`""
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } #             if ($data[8] -ne "null") {
        if ($data[9] -ne "null") {
            $log = "subnet_id = azurerm_subnet.", $data[9], ".id" 
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } #            if ($data[9] -ne "null") {
        if ($data[12] -ne "null") {
            $log = "public_ip_address_id = azurerm_public_ip.", $data[12], ".id"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile
        } #             if ($data[12] -ne "null") {
        $log = "`n}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $tempfile

        # if no additional rules exist in this group write out final frontend config file and clear temp rule file
        if ($data[11] -eq "no") {

            # pull in the temp rule file and wipe it out
            foreach($line in (Get-Content $tempfile)) {
                $line | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            }
            Clear-Content $tempfile

        } #        if ($data[11] -eq "no") {

        # write tag data if no extra front end lines config required
        if ($data[11] -eq "no") {
            # tags supported
            $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
            $log = "}","`n"
            $log = [system.String]::Join("", $log)
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        } #         if ($data[11] -eq "no") {

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -like "*-load_balancer*")) {
    
    # detect and process load balancer backend pool 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -5) -eq "-lbbp")) {
        $log = "`n", "load balancer backend pool detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "load balancer backend pool value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write load balancer backend pool data
        $log = "resource `"azurerm_lb_backend_address_pool`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "loadbalancer_id = azurerm_lb.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -5) -eq "-lbbp")) {
    
    # detect and process load balancer backend pool address association
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -7) -like "*-lbbpa*")) {
        $log = "`n", "load balancer backend pool address association detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "load balancer backend pool address association value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write load balancer backend pool address association data
        $log = "resource `"azurerm_network_interface_backend_address_pool_association`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "network_interface_id = azurerm_network_interface.", $data[2], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "ip_configuration_name = `"", $data[3], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $data[5] = $data[5] -replace " ", ""
        $log = "provider = azurerm.", $data[5]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        #$log = "resource_group_name = azurerm_resource_group.", $data[6], ".name"
        #$log = [system.String]::Join("", $log)
        #$log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "backend_address_pool_id = azurerm_lb_backend_address_pool.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -6) -eq "-lbbpa")) {

        # detect and process load balancer lb probe 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -5) -eq "-lbhp")) {
        $log = "`n", "load balancer lb probe detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "load balancer lb probe value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write load balancer lb probe data
        $log = "resource `"azurerm_lb_probe`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "name = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "loadbalancer_id = azurerm_lb.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "protocol = `"", $data[6], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "port = ", $data[7]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "interval_in_seconds = ", $data[8]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "number_of_probes = ", $data[9]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -5) -eq "-lbhp")) {
    
    # detect and process load balancer lb rules
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -4) -eq "-lbr")) {
        $log = "`n", "load balancer lb rule detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "load balancer lb rule value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write load balancer lb rule data
        $log = "resource `"azurerm_lb_rule`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "name = `"", $data[14], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "loadbalancer_id = azurerm_lb.", $data[4], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "protocol = `"", $data[5], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "frontend_port = ", $data[6]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "backend_port = ", $data[7]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "frontend_ip_configuration_name = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "enable_floating_ip = ", $data[9].tolower()
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "backend_address_pool_id = azurerm_lb_backend_address_pool.", $data[10], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "idle_timeout_in_minutes = ", $data[11]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "probe_id = azurerm_lb_probe.", $data[12], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "depends_on = `[azurerm_lb_probe.", $data[12], "`]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $temp = $data[15].tolower()
        $log = "disable_outbound_snat = `"", $temp, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $lbfile

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[0].Substring($data[0].Length -4) -eq "-lbr") {
    
    # detect and process f5 lb data
    if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "f5data")) {
        $log = "`n", "f5 data detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write f5 data

        $log = "data `"template_file`" `"f5vm_onboard`" {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "template = `"`$`{path.module`}`/F5_Configuration/onboard.tpl.sh`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "vars = {
uname          = `"azops`"
upassword      = `"Canada1!`"
DO_onboard_URL = `"https://github.com/steveh565/f5tools/raw/master/f5-declarative-onboarding-1.9.0-1.noarch.rpm`"
AS3_URL        = `"https://github.com/steveh565/f5tools/raw/master/f5-appsvcs-3.16.0-6.noarch.rpm`"
TS_URL         = `"https://github.com/steveh565/f5tools/raw/master/f5-telemetry-1.8.0-1.noarch.rpm`"
CF_URL         = `"https://github.com/steveh565/f5tools/raw/master/f5-cloud-failover-1.0.0-0.noarch.rpm`"
libs_dir       = `"/config/cloud/azure/node_modules`"
onboard_log    = `"/var/log/startup-script.log`"
}"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "}`n`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "`data `"template_file`" `"f5vm01_do_json`" {
template = `"`$`{path.module`}`/F5_Configuration/cluster_via_nlb_do.tpl.json`"

vars = {
regkey = `"ACLDT-YSKWQ-FMRRY-DAKMJ-WISHHWG`"
host1          = `"f5vm01`"
host2          = `"f5vm02`"
domainname     = `"csd.local`"
local_host     = `"f5vm01`""
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "local_selfip1  = azurerm_network_interface.", $f5vm01ext_nic_name, ".private_ip_address"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "local_selfip2  = azurerm_network_interface.", $f5vm01int_nic_name, ".private_ip_address"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        # to be activated when public ip is available for load balancer
        $log = "remote_selfip  = azurerm_public_ip.", $data[2],".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "dns_server     = `"8.8.8.8`"
ntp_server     = `"0.us.pool.ntp.org`"
timezone       = `"UTC`"
admin_user     = `"azops`"
admin_password = `"Canada1!`"
banner_color   = `"red`"

}
}`n`n"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        # vars pending definition
        #gateway        = `"${local.ext_gw}`"
        #mgmt_gw        = local.mgmt_gw
        

        $log = "`n`n`data `"template_file`" `"f5vm02_do_json`" {
template = `"`$`{path.module`}`/F5_Configuration/cluster_via_nlb_do.tpl.json`"

vars = {
regkey = `"KBWWG-HASHM-TIQAK-MWPHX-BHKSTQV`"
host1          = `"f5vm02`"
host2          = `"f5vm01`"
domainname     = `"csd.local`"
local_host     = `"f5vm02`""
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "local_selfip1  = azurerm_network_interface.", $f5vm02ext_nic_name, ".private_ip_address"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "local_selfip2  = azurerm_network_interface.", $f5vm02int_nic_name, ".private_ip_address"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        # to be activated when public ip is available for load balancer
        $log = "remote_selfip  = azurerm_public_ip.", $data[2],".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "dns_server     = `"8.8.8.8`"
ntp_server     = `"0.us.pool.ntp.org`"
timezone       = `"UTC`"
admin_user     = `"azops`"
admin_password = `"Canada1!`"
banner_color   = `"red`"

}
}`n`n"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        # vars pending definition
        #gateway        = `"${local.ext_gw}`"
        #mgmt_gw        = local.mgmt_gw

        $log = "`n`ndata `"template_file`" `"as3_json`" {
template = `"`$`{path.module`}`/F5_Configuration/tsLogCollection_as3.tpl.json`"
vars = {"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "rg_name = `"azurerm_resource_group.", $f5vm1_rg_name, ".name`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "}`n}"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        
        $log = "`n`ndata `"template_file`" `"ts_json`" {
template = `"`$`{path.module`}`/F5_Configuration/tsLaw.tpl.json`""
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "depends_on = [azurerm_log_analytics_workspace.", $data[1] ,"]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "vars = {"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "law_id = `"$`{azurerm_log_analytics_workspace.", $data[1], ".workspace_id`}`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "law_primkey = `"$`{azurerm_log_analytics_workspace.", $data[1], ".primary_shared_key`}`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "}`n}"
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

    } #     if (($data[0].Substring(0,1) -ne "#") -and ($data[0] -eq "f5data")) {

    # detect and process f5 vms 
    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "f5")) {
        $log = "`n", "f5 vm detected - ", $line
        $log = [system.String]::Join("", $log)
        Write-Output $log
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
        $log = "`n", "f5 vm value - ", $data[0]
        $log = [system.String]::Join("", $log)
        Write-Output $log

        # write vm general data
        $log = "resource `"azurerm_virtual_machine`" `"", $data[0], "`" {","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "name = `"", $data[0], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "location = `"", $location, "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "resource_group_name = azurerm_resource_group.", $data[2], ".name"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $data[3] = $data[3] -replace " ", ""
        $log = "provider = azurerm.", $data[3]
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $nics = $data[6] -split ";"
        $log = "network_interface_ids = [azurerm_network_interface.", $nics[0], ".id",", azurerm_network_interface.", $nics[1], ".id",", azurerm_network_interface.", $nics[2], ".id]"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "primary_network_interface_id = azurerm_network_interface.", $data[15], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "availability_set_id = azurerm_availability_set.", $data[13], ".id"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "vm_size = `"", $data[7], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "delete_data_disks_on_termination = `"true`"
delete_os_disk_on_termination    = `"true`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        # settings
        $log = "os_profile {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "computer_name = `"", $data[8], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "admin_username = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "admin_password = `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        # will be added into os_profile later as part of post deployment config 
        #$log = "custom_data = `"`$`{data.template_file.vm_onboard.rendered`}`""
        #$log = [system.String]::Join("", $log)
        #$log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file


        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "
storage_image_reference {
publisher = `"f5-networks`"
offer     = `"f5-big-ip-byol`"
sku       = `"f5-big-all-2slot-byol`"
version   = `"latest`"
}
`n
plan {
name      = `"f5-big-all-2slot-byol`"
publisher = `"f5-networks`"
product   = `"f5-big-ip-byol`"
}
`n
os_profile_linux_config {
disable_password_authentication = false
}
"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "storage_os_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "name = `"", $data[12], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "caching       = `"ReadWrite`"
create_option = `"FromImage`"
os_type       = `"Linux`"
managed_disk_type = `"Standard_LRS`"
disk_size_gb  = `"80`"
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "storage_data_disk {"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "name = `"", $data[14], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "
lun           = 0
caching       = `"None`"
create_option = `"Empty`"
disk_size_gb  = `"30`"
}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        $log = "provisioner `"remote-exec`" `{
connection `{"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "host     = azurerm_public_ip.", $data[17],".ip_address"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "type     = `"ssh`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "user     = `"", $data[9], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "password = `"", $data[10], "`""
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "`}
when = destroy
inline = [
`"echo y | tmsh revoke sys license`"
]
on_failure = continue
`}"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        # tags supported in vm
        $alltags | Out-File -Append -Force -Encoding utf8 -FilePath $f5file
        $log = "}","`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $f5file

        # write script to modify subscriptions to accept azure marketplace licenses for f5 load balancer
        if ($azuremktflag2 -eq 0) {
            $log = "# Please run these commands to modify core subscription to accept azure marketplace licenses for f5 load balancer"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            $log = "# You will be prompted to login first via powershell to reach the tenant; please run this on a deployment host with unblocked ports [not ssc laptop]"
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            if ($azuremktflag1 -eq 0) {
                $log = "`n`nConnect-AzAccount`n`n"
            }
            $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
            $azuremktflag2 = 1
        } #        if ($azuremktflag2 = 0) {

        $log = "Set-AzContext -SubscriptionId `"", $data[18], "`"`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace
        $log = "Get-AzMarketplaceTerms -Publisher f5-networks -Product f5-big-ip-byol -Name f5-big-all-2slot-byol `| Set-AzMarketplaceTerms -Accept`n"
        $log = [system.String]::Join("", $log)
        $log | Out-File -Append -Force -Encoding utf8 -FilePath $azuremarketplace

    } #    if (($data[0].Substring(0,1) -ne "#") -and ($data[11] -eq "f5")) {

} # foreach($line in [System.IO.File]::ReadLines($inputfile))

# write readme file with remote state info
$log = "`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "-------------Remote State Configuration----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "This deployment is set to default local state but files are provided to manage remote state - `n", $remoteblobfile, "`n", $remotebackendfile
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "First deploy the infrastructure with ``terraform plan`` and ``terraform apply`` to create all elements including required remote storage."
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Then login to Azure portal and browse to the storage container and retrieve the access key to place into - ", $remotebackendfile
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "To activate remote state rename the .tf_ to .tf for the file and run ``terraform init`` prior to running ``terraform plan`` and ``terraform apply`` - ", $remotebackendfile
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "-------------Secret key file----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Please note for access to the tenant a separate file is expected as follows - `n", $keyfile
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "This file should contain the following variables in csv format - `nclient_id,value`nclient_secret,value`ntenant_id,value`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "-------------Fortinet Firewall licenses----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Please be sure to run the script azuremarketplace.ps1 to prepare the subscriptions to issue Fortinet firewall licenses.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Once the firewall is deployed via terraform it will be necessary to activate the license; there needs to be internet access to the http interface for this.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Licenses can be received via registration and download at https://support.fortinet.com/`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "-------------Fortinet Firewall configuration----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "The default fortinet configuration is in the file ScScCSDfg2_20200131_0808.conf; a standard Azure landing zone VDC specific config is in fw01_20200130_0829.conf.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Warning - importing this file will overwrite all default settings such as login / password , networks, etc.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Once the firewall is running please restore your preferred config thus - https://gcdocs.gc.ca/ssc-spc/llisapi.dll?func=ll&objaction=overview&objid=67152941.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "-------------Azure LZ Reporting Tool----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "Luc St-Jean in CPMSD has developed a comprehensive Azure reporting tool that gathers critical data from the Azure tenant and subscription.`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "For details please see docs at https`:`/`/bit.ly`/2YyJvB6 and https`:`/`/bit.ly`/3fn3kBo and the tool at https`:`/`/bit.ly`/2L4jOjz`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "`n"
$log = "-------------Deployment Host / Visual Studio Code Setup----------------------`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "To facilitate setup of the intended deployment host please use script - SetupDeploymentHost.ps1`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "To facilitate customization of Visual Studio code please use script - installVSCextensions.bat`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
$log = "`n"
$log = [system.String]::Join("", $log)
$log | Out-File -Append -Force -Encoding utf8 -FilePath $readmefile
