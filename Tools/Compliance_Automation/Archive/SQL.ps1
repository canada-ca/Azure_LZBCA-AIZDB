
#Ensure that Azure Active Directory Admin is configured

Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {(Get-AzSqlServerActiveDirectoryAdministrator -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName).DisplayName}


#Ensure Send Alert to is set. (email address to which alerts will be sent upon detection of anomalous activities on SQL databases.

Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {(Get-AzSqlServerAdvancedThreatProtectionSetting -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName).EmailAdmins}


# Ensure that Transparent Data Encryption is set to On

Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {Get-AzSqlDatabase -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName} | %{(Get-AzSqlDatabaseTransparentDataEncryption -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName -DatabaseName $_.DatabaseName).State}


# Ensure that Server Level Auditing is enabled. 

Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {(Get-AzSqlServerAudit -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName).BlobStorageTargetState}


# Ensure that Threat Detection is set to On
Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {(Get-AzSqlServerAdvancedThreatProtectionSetting -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName).ThreatDetectionState}

# Ensure Advanaced Threat Protection Types should be On in SQL Server

Get-AzResourceGroup | % {Get-AzSqlServer -ResourceGroupName $_.ResourceGroupName} | % {(Get-AzSqlServerAdvancedDataSecurityPolicy -ServerName $_.ServerName -ResourceGroupName $_.ResourceGroupName).IsEnabled}


