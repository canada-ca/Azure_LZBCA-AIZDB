
$subscriptionId = "f3c68f92-f832-4632-82d5-c6c7a9e37e08"

#Function to fetch compliance info and generate report
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Set-Item ENV:ReportPath "C:\Apps\polictverifications"
Set-Item ENV:ReportName "ComplianceAudit"

Write-Host "Fetching data..."
$csv = Import-Csv -Path ./complianceAuditJUN05.csv

# $subscriptionId = (Get-AzSubscription).Id

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
 echo $res
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
  } | Select 'Requirement ID', 'Recommendation #', 'CONTROL #', 'GR #', 'MS PBMM Blueprint', 'CONTROL NAME', Title, Description, 'Rationale statement', 'Remediation procedure', 'Audit procedure (Manual)', 'Audit procedure (Automatic)', 'Compliance Status'

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
