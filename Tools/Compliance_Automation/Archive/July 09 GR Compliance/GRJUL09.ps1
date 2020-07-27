#Paths, Files and Script Start Time Variable

    $startTM = (Get-Date)

    $current_dir = Convert-Path .
	$log = "Current working directory - ", $current_dir
	Write-Output $log
	
	$current_date = Get-Date -Format "yyyyMMdd"
	$log = "Current date time stamp - ", $current_date
	Write-Output $log
	
	$logfile = $current_dir, "\", "AzureGR", $current_date, ".txt"
	$logfile = [system.String]::Join("", $logfile)
	$log = "Logfile set to - ", $logfile, "`n"
	Clear-Content $logfile
	Write-Output $log
	$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile


    $reportfile = $current_dir, "\", "AzGRAudit", $current_date,".html"
    $reportfile = [system.String]::Join("", $reportfile)
    $log = "Report file set to - ", $reportfile, "`n"
	Write-Output $log
	$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile


    #Set Subscrption and Env Variables

    
    
    # $subscriptionId = (Get-AzSubscription).Id

    $subscriptionId = "f3c68f92-f832-4632-82d5-c6c7a9e37e08"

    Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
    Set-Item ENV:ReportPath $current_dir
    Set-Item ENV:ReportName AzureGR
    $log = "ReportPath & ReportNames are set to - ", $ENV:ReportPath, $ENV:ReportName
    Write-Output $log
   	$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile


    $inputfile = $current_dir, "\", "AzureGR.csv"
    $inputfile = [system.String]::Join("", $inputfile)
    $log = "inputfile set to - ", $inputfile, "`n"
    Write-Output $log
    $log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    

    Write-Host "Fetching data..."
    $csv = Import-Csv -Path $inputfile




#Generate Report
$tabarray = @('Audit Result (COMPLIANT)','Audit Result (NON-COMPLIANT)', 'Manual Process')
$rpt = @()
$rpt += Get-HTMLOpenPage -TitleText "Compliance Audit Report for Subscription ID: - $SubscriptionId" -LeftLogoString "https://www.hc-sc.gc.ca/images/templates/wmms.gif" -RightLogoName Blank
$rpt += Get-HTMLTabHeader -TabNames $tabarray

$compliantControls = @()
$nonCompliantControls = @()
$manualProcess = @()

$csv | % {
  if ([String]::IsNullOrEmpty($_.'audit procedure (Automatic)')){
    $curPolState = 'manual'
  } else {
    $curPolState = 'Non-compliant'
    $res = Invoke-expression "$(($_.'audit procedure (Automatic)'))" | Out-String

    $res = $res -join ("`r`n")

Write-Output $res
$res | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

    if ($_.'Check condition' -eq 'should contain'){
      if($res.Contains($_.'Expected Result (output of command)')){
        $curPolState = 'Compliant'
      }
    } elseif ($_.'Check condition' -eq 'should not contain') {
      if(! $res.Contains($_.'Expected Result (output of command)')){
        $curPolState = 'Compliant'
      }
    }
  }

  $policyReportObj = New-Object PSObject -Property @{
    'Requirement ID' = $_.'Requirement ID'
    'Recommendation #' = $_.'recommendation #'
    'CONTROL #' = $_.'CONTROL #'
    'GR #' = $_.'GR #'
    'MS PBMM Blueprint' = $_.'MS PBMM Blueprint'
    'CONTROL NAME' = $_.'CONTROL NAME'
    Title = $_.Title
    Description = $_.Discription
    'Rationale statement' = $_.'rationale statement'
    'Remediation procedure' = $_.'remediation procedure'
    'Audit procedure (Manual)' = $_.'audit procedure (Manual)'
    'Audit procedure (Automatic)' = $_.'audit procedure (Automatic)'
    'Compliance Status' = $curPolState
  } | Select 'Requirement ID', 'Recommendation #', 'CONTROL #', 'GR #', 'MS PBMM Blueprint', 'CONTROL NAME', Title, Description, 'Rationale statement', 'Audit procedure (Manual)', 'Audit procedure (Automatic)', 'Compliance Status'

  if ($curPolState -eq 'Non-compliant'){
    $nonCompliantControls += $policyReportObj
  } elseif ($curPolState -eq 'Compliant') {
    $compliantControls += $policyReportObj
  } elseif ($curPolState -eq 'manual'){
    $manualProcess += $policyReportObj
  }
}

Write-Host "Generating Report..."
#------------------Tab 1--------------------
$rpt += get-htmltabcontentopen -TabName "Audit Result (COMPLIANT)" -tabheading ('Compliant Controls')
$rpt+= Get-HtmlContentOpen -HeaderText "<center>Information on Compliant controls</center>"
try {
  $rpt+= Get-HtmlContentdataTable $compliantControls
}catch{
}
$rpt+= Get-HtmlContentClose
$rpt += get-htmltabcontentclose
#-------------------------------------------

#------------------Tab 2--------------------
$rpt += get-htmltabcontentopen -TabName "Audit Result (NON-COMPLIANT)" -tabheading ('Non-Compliant Controls' )
$rpt+= Get-HtmlContentOpen -HeaderText "<center>Information on Non-compliant controls</center>"
try {
  $rpt+= Get-HtmlContentdataTable $nonCompliantControls
}catch{
}
$rpt+= Get-HtmlContentClose
$rpt += get-htmltabcontentclose
#-------------------------------------------

#------------------Tab 3--------------------
$rpt += get-htmltabcontentopen -TabName "Manual Process" -tabheading ('MANUAL PROCESS' )
$rpt+= Get-HtmlContentOpen -HeaderText "<center>Information on controls that need manual processing</center>"
try {
  $rpt+= Get-HtmlContentdataTable $manualProcess
}catch{
}
$rpt+= Get-HtmlContentClose
$rpt += get-htmltabcontentclose
#-------------------------------------------

$rpt += Get-HTMLClosePage
Save-HTMLReport -ReportContent $rpt -ShowReport -ReportPath $ENV:ReportPath -ReportName $ENV:ReportName


#Script Execution Time Calculation

$endTM = (Get-Date)
$log = "Total script execution time: $(($endTM-$startTM).totalseconds) seconds"
Write-Host $log -ForegroundColor Yellow -BackgroundColor DarkGreen
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile
