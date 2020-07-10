#POC Function to fetch compliance evidence and generate HTML report
#Set ENV Variables for storing an evidence report
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Set-Item ENV:ReportPath "C:\apps\polictverifications"
Set-Item ENV:ReportName "ComplianceReportES"

#Fetch data from Azure subscription
Write-Host "Fetching data..."
#$subscriptionId = (Get-AzSubscription).Id
$SubscriptionId = "1a5961ed-8b0e-45e0-8e0d-40cde6eb4499"
#$SubscriptionId = "d6f20abe-9663-4bff-a29f-2d66f353ccca"

#Fetch data from Azure
#Write-Host "Fetching data..."
#$subscriptionId = (Get-AzSubscription).Id

$policyState = Get-AzPolicyState

$statesummary = Get-AzPolicyStateSummary

$defIDs = $statesummary.PolicyAssignments.PolicyDefinitions |%{$_.PolicyDefinitionId}

#Generate HTML Report
Write-Host "Generating Report..."
$tabarray = @('Compliant Policies','Non-compliant Policies')
$rpt = @()
$rpt += Get-HTMLOpenPage -TitleText "Guardrails Compliance Evidence - Existing State (Read Only Mode) for Subscription ID: $SubscriptionId" -LeftLogoString "https://www.hc-sc.gc.ca/images/templates/wmms.gif" -RightLogoName Blank
$rpt += Get-HTMLTabHeader -TabNames $tabarray

$compliantPoliciesReport = @{}
$nonCompliantPoliciesReport = @{}

$defIDs | % {
  $curPolState = 'Compliant'
  $policyReportObj = $policyState | Where-Object -Property PolicyDefinitionId -eq $_ | %{
    if($_.ComplianceState -eq 'NonCompliant'){
      $curPolState = 'Non-compliant'
    }
    New-Object PSObject -Property @{
      'Resource' = $_.Resource
      'ResourceGroup' = $_.ResourceGroup
      'ResourceLocation' = $_.ResourceLocation
      'ResourceType' = $_.ResourceType
      'Compliance State' = $_.ComplianceState
      'Policy Action' = $_.PolicyDefinitionAction
    }
  } | Select Resource, ResourceGroup, ResourceLocation, ResourceType, 'Policy Action', 'Compliance State'

  if ($curPolState -eq 'Non-compliant'){
    $nonCompliantPoliciesReport.Add($((Get-AzPolicyDefinition -Id $_).Properties.displayName), $policyReportObj)
  } else {
    $compliantPoliciesReport.Add($((Get-AzPolicyDefinition -Id $_).Properties.displayName), $policyReportObj)
  }
}

#------------------Tab 1--------------------
$rpt += get-htmltabcontentopen -TabName "Compliant Policies" -tabheading ('Compliant Policies' )
$rpt += Get-HTMLContentText -Heading "Compliant Policies" -Detail "Information on Compliant policies"
$compliantPoliciesReport.Keys | % {
  $rpt+= Get-HtmlContentOpen -HeaderText "Policy Name: $($_) &emsp; &emsp; &emsp; Policy State: Compliant"
  $rpt+= Get-HtmlContentdataTable $compliantPoliciesReport.Item($_)
  $rpt+= Get-HtmlContentClose
}
$rpt += get-htmltabcontentclose
#-------------------------------------------

#------------------Tab 2--------------------
$rpt += get-htmltabcontentopen -TabName "Non-compliant Policies" -tabheading ('Non-compliant Policies' )
$rpt += Get-HTMLContentText -Heading "Non-compliant Policies" -Detail "Information on Non-compliant policies"
$nonCompliantPoliciesReport.Keys | % {
  $rpt+= Get-HtmlContentOpen -HeaderText "Policy Name: $($_) &emsp; &emsp; &emsp; Policy State: Non-compliant"
  $rpt+= Get-HtmlContentdataTable $nonCompliantPoliciesReport.Item($_)
  $rpt+= Get-HtmlContentClose
}
$rpt += get-htmltabcontentclose
#-------------------------------------------

$rpt += Get-HTMLClosePage
Save-HTMLReport -ReportContent $rpt -ShowReport -ReportPath $ENV:ReportPath -ReportName $ENV:ReportName
