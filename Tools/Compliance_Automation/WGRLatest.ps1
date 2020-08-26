#Paths, Files and Script Start Time Variable
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
$startTM = (Get-Date)

$current_dir = Convert-Path .
$log = "Current working directory - ",$current_dir
Write-Output $log

#New Code

$current_dir = Convert-Path .
$current_date = Get-Date -Format "-yyyyMMdd-HH-MM"

$Tinputfile = $current_dir,"\","TenantsGR.csv"
$Tinputfile = [System.String]::Join("",$Tinputfile)
$Tcsv = Import-Csv -Path $Tinputfile


#New Code

foreach($tenant in $Tcsv) {
Write-Host $tenant.'Tenant ID'
Write-Host $tenant.'Subscription ID'
$SName = $tenant.'Subscription Name'
Write-Host $SName
$TName = $tenant.'Tenant Name'
Write-Host $TName

$TDstring = '-' + $tenant.'Tenant ID'.SubString(24)

$subscriptionId = $tenant.'Subscription ID'

$Tdir = $current_dir,"\",$TName,$TDstring,$current_date
$Tdir = [System.String]::Join("",$Tdir)

if(!(Test-Path -Path $Tdir )){
    New-Item -ItemType directory -Path $Tdir
    Write-Host "New folder created"
}
else
{
  Write-Host "Folder already exists"
}



foreach($sub in $subscriptionId) {

Write-Host $subscriptionId

$secpasswd = ConvertTo-SecureString $tenant.password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($tenant.username, $secpasswd)

Connect-AzAccount -ServicePrincipal -Credential $mycreds -tenant $tenant.'Tenant ID'


Get-AzSubscription -SubscriptionId $subscriptionId 
Set-AzContext -Subscription $SName

$dir = $Tdir,"\",$SName
$dir = [System.String]::Join("",$dir)

if(!(Test-Path -Path $dir )){
    New-Item -ItemType directory -Path $dir
    Write-Host "New folder created"
}
else
{
  Write-Host "Folder already exists"
}




#New Code End





$logfile = $current_dir,"\","AzureGR",$current_date,".txt"
$logfile = [System.String]::Join("",$logfile)
$log = "Logfile set to - ",$logfile,"`n"
Clear-Content $logfile
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile


$disclaimerFile = $current_dir,"\","AzureDIS",".txt"
$disclaimerFile = [System.String]::Join("",$disclaimerFile)


$reportfile = $dir,"\","AzGRAudit",".html"

# $reportfile = $current_dir,"\","AzGRAudit",".html"
$reportfile = [System.String]::Join("",$reportfile)
$log = "Report file set to - ",$reportfile,"`n"
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"
Set-Item ENV:ReportPath $current_dir
Set-Item ENV:ReportName AzureGR
$log = "ReportPath & ReportNames are set to - ",$ENV:ReportPath,$ENV:ReportName
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$inputfile = $current_dir,"\","AzureGR.csv"
$inputfile = [System.String]::Join("",$inputfile)
$log = "inputfile set to - ",$inputfile,"`n"
Write-Output $log
$log | Out-File -Append -Force -Encoding utf8 -FilePath $logfile

$ReportTitle = '30 Day Guardrail'


# $subscriptionId = "b51875d6-08eb-4c59-bd8c-61fe5a48727a"

#$subscriptionId = "f3c68f92-f832-4632-82d5-c6c7a9e37e08"
# Set-AzContext -Subscription $subscriptionId

#       $subscriptionId = "cd4177c0-e9ea-465c-8620-8e86ae359d17"
<#
ScSc-PBMM CTO Sandbox          f3c68f92-f832-4632-82d5-c6c7a9e37e08 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScPc-PBMM CTO Production       111a899a-00e3-4875-a8e3-9145e74869a2 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScPc-PBMM CTO Core             ea8ef8d1-5e93-4835-a0f1-c749a44d5cff 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScDc-PBMM CTO Development      58c54c05-93d3-4fe9-8a49-62a44400bc8c 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScDc-PBMM CIO Development      63db14cb-3ff1-4bea-95e3-c1350e7f705f 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScSc-PBMM CIO Sandbox          c00dd93b-0f2b-4cd6-8273-e1038dcbd60e 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScSc-PBMM CTO CCOE Sandbox     807e6f06-0924-486f-b6a8-9607a315c6ce 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
LzDc-PBMM CTO Landing Zone BCA 77edcdc3-fb6b-4e75-aa87-37cc5c5b49b5 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScDc-PBMM CIO ESLZ             ed433324-b886-4c85-b62c-49283b83cafd 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
ScDc-PBMM CTO PolicyDesign     eea694af-ccb4-4ce4-9ca5-904708690694 4e1ed7ae-062e-4ec8-b989-de8cbd452c54 Enabled
#>



Write-Host "Fetching data..."
$csv = Import-Csv -Path $inputfile

# Arrays for storing compliance info    

$compliantControls = @()
$nonCompliantControls = @()
$manualProcess = @()
# $remediation = @()
# $remediation1 = @()
# $finalRm = @()

$csv | ForEach-Object {
  if ([string]::IsNullOrEmpty($_.'audit procedure (Automatic)')) {
    $curPolState = 'manual'
  } else {
    $curPolState = 'Non-compliant'
    $res = Invoke-Expression "$(($_.'audit procedure (Automatic)'))" | Out-String

    $res = $res -join ("`r`n")

    Write-Output $res

    $resFile = $dir,'\',$_.'Requirement ID'
    $resFile = [System.String]::Join("",$resFile)
    $res | Out-File -Encoding utf8 -FilePath $resFile 

 #   $res | Out-File -Encoding utf8 -FilePath $_.'Requirement ID'

    if ($_. 'Check condition' -eq 'should contain') {
      if ($res.Contains($_.'Expected Result (output of command)')) {
        $curPolState = 'Compliant'
      }
    } elseif ($_. 'Check condition' -eq 'should not contain') {
      if (!$res.Contains($_.'Expected Result (output of command)')) {
        $curPolState = 'Compliant'
      }
    }
  }

  $policyReportObj = New-Object PSObject -Property @{
    'RequirementID' = $_.'Requirement ID'
    'Recommendation #' = $_.'recommendation #'
    'CONTROL #' = $_.'CONTROL #'
    'GR #' = $_.'GR #'
    'MS PBMM Blueprint' = $_.'MS PBMM Blueprint'
    'CONTROL NAME' = $_.'CONTROL NAME'
    Title = $_.Title
    Description = $_.Discription
    'Rationale statement' = $_.'rationale statement'
    'Remediation' = $_.'remediation procedure'
    'Audit procedure (Manual)' = $_.'audit procedure (Manual)'
    'Audit procedure (Automatic)' = $_.'audit procedure (Automatic)'
    'Compliance Status' = $curPolState
    'Evidence' = $_.'Evidence'
  } | Select-Object 'RequirementID','Recommendation #','GR #','CONTROL #','CONTROL NAME',Title,Description,'Rationale statement','Audit procedure (Manual)','Remediation','Audit procedure (Automatic)','Compliance Status','Evidence'



  if ($curPolState -eq 'Non-compliant') {
    $nonCompliantControls += $policyReportObj | Select-Object -Property 'RequirementID','Recommendation #','GR #','CONTROL #','CONTROL NAME',Title,'Rationale statement','Audit procedure (Manual)', 'Remediation', 'Audit procedure (Automatic)','Compliance Status','Evidence'
  } elseif ($curPolState -eq 'Compliant') {
    $compliantControls += $policyReportObj | Select-Object -Property 'RequirementID','Recommendation #','GR #','CONTROL #','CONTROL NAME',Title,'Rationale statement','Audit procedure (Manual)', 'Remediation', 'Audit procedure (Automatic)','Compliance Status','Evidence'
  } elseif ($curPolState -eq 'manual') {
    $manualProcess += $policyReportObj | Select-Object -Property 'RequirementID','Recommendation #','GR #','CONTROL #','CONTROL NAME',Title,'Rationale statement','Audit procedure (Manual)', 'Remediation', 'Audit procedure (Automatic)','Compliance Status','Evidence'
  }



  # $remediation += $policyReportObj.Remediation
  # $remediation1 += $policyReportObj.RequirementID


  # [int]$max = $remediation.Count
  # if ([int]$remediation1.count -gt [int]$remediation.count) { $max = $remediation1.Count; }

  # $finalRm = for ( $i = 0; $i -lt $max; $i++)
  # {
  #   Write-Verbose "$($remediation1[$i]),$($remediation[$i])"
  #   [PSCustomObject]@{
  #       RequirementID = $remediation1[$i]
  #       Remediation = $remediation[$i]

  #   }
  # }

}


# Report Generation

$ImageLink = 'https://www.hc-sc.gc.ca/images/templates/wmms.gif'

Dashboard -Name '30 Day Guardrail' -FilePath $reportfile {
  New-HTMLLogo -LeftLogoString $ImageLink

  TabOptions -SelectorColor AntiqueWhite -Transition -LinearGradient -SelectorColorTarget Red -BorderBackgroundColor Gold
  Tab -Name 'Compliant Controls' {
    New-HTMLContent -HeaderText "Compliance Report Date: $(Get-Date)  - Subscription ID: $SubscriptionId " -TextAlignment left -TextColor Yellow -TextBackGroundColor DodgerBlue {
      Section -Name 'Compliant Guardrail Controls' -CanCollapse {
        Table -DataTable $compliantControls {
          TableConditionalFormatting -Name 'Compliance Status' -ComparisonType string -Operator eq -Value 'Compliant' -Color White -BackgroundColor Green

        }
      }

    }
    Section -Name 'Disclaimer Information' {
      Section -Name 'Disclaimer' {
        Panel {
          $Text = Get-Content -Path $disclaimerFile

          Table -DataTable $Text -HideFooter

        }
      }
    }
  }

  Tab -Name 'Non-Compliant Controls' {
    Section -Name 'Non-Compliant Guardrail Controls' -CanCollapse {
      Panel {
        Table -DataTable $nonCompliantControls -HideFooter

      }

    }

    Section -Name 'Disclaimer Information' {

      Section -Name 'Disclaimer' {
        Panel {
          $Text = Get-Content -Path $disclaimerFile

          Table -DataTable $Text -HideFooter

        }
      }
    }
  }




  Tab -Name 'Manual Controls' {
    Section -Name 'Manual Controls' -CanCollapse {
      Panel {
        Table -DataTable $manualProcess -HideFooter

      }

    }

    Section -Name 'Disclaimer Information' {

      Section -Name 'Disclaimer' {
        Panel {
          $Text = Get-Content -Path $disclaimerFile

          Table -DataTable $Text -HideFooter

        }
      }
    }
  }
}
#  Link Creation Code Block


(Get-Content "$reportFile") | ForEach-Object {


  $_ -replace "EAZ-L1-009",'<a href="./AZ-L1-009">Link</a>' `
     -replace "EAZ-L1-012",'<a href="./AZ-L1-012">Link</a>' `
     -replace "EAZ-L1-013",'<a href="./AZ-L1-013">Link</a>' `
     -replace "EAZ-L1-028",'<a href="./AZ-L1-028">Link</a>' `
     -replace "EAZ-L1-014",'<a href="./AZ-L1-014">Link</a>' `
     -replace "EAZ-L1-021a",'<a href="./AZ-L1-021a">Link</a>' `
     -replace "EAZ-L1-021b",'<a href="./AZ-L1-021b">Link</a>' `
     -replace "EAZ-L1-022",'<a href="./AZ-L1-022">Link</a>' `
     -replace "EAZ-L1-027",'<a href="./AZ-L1-027">Link</a>' `
     -replace "EAZ-L1-032",'<a href="./AZ-L1-032">Link</a>' `
     -replace "EAZ-L1-033",'<a href="./AZ-L1-033">Link</a>' `
     -replace "EAZ-L1-045",'<a href="./AZ-L1-045">Link</a>' `
     -replace "EAZ-L1-047",'<a href="./AZ-L1-047">Link</a>' `
     -replace "EAZ-L1-048",'<a href="./AZ-L1-048">Link</a>' `
     -replace "EAZ-L1-051",'<a href="./AZ-L1-051">Link</a>' `
     -replace "EAZ-L1-066",'<a href="./AZ-L1-066">Link</a>' `
     -replace "EAZ-L1-068",'<a href="./AZ-L1-068">Link</a>' `
     -replace "EAZ-L1-069",'<a href="./AZ-L1-069">Link</a>' `
     -replace "EAZ-L1-001",'<a href="./AZ-L1-001">Link</a>' `
     -replace "EAZ-L1-002",'<a href="./AZ-L1-002">Link</a>' `
     -replace "EAZ-L1-063",'<a href="./AZ-L1-063">Link</a>' `
     -replace "EAZ-L1-064",'<a href="./AZ-L1-064">Link</a>'


} |
Set-Content $reportFile

}
}
$ImageLink = 'https://www.hc-sc.gc.ca/images/templates/wmms.gif'
$DIRs = Get-ChildItem -Path $current_dir -Directory 
$T = "Tenant Name :" 
 
New-HTML -Name 'Index of Reports' -FilePath $current_dir\Index.html -Show { 

New-HTMLLogo -LeftLogoString $ImageLink
New-HTMLContent -HeaderText "Index of Reports sorted by Tenants/Subscriptions | Date: $(Get-Date) " -TextAlignment left -TextColor Yellow -TextBackGroundColor Green {

foreach($d in $DIRs) { 

$rpts = Get-ChildItem -Path $d -Recurse -Force -ErrorAction SilentlyContinue -File -Include *html -Exclude Index.html | Select-Object -Property @{N='Report Path';E={"<a href='$_'>{0}</a>" -f ($_.FullName | Resolve-Path -Relative)}} 
 
Section -Name ($T + $d.Name) -TextAlignment left -TextBackGroundColor DodgerBlue { 
   Panel {
      New-HTMLTable -DataTable $rpts -InvokeHTMLTags -PagingOptions @(50, 100, 150, 200) -HideFooter 
    } 
  } 
}

}

Section -Name 'Disclaimer Information' {
   Section -Name 'Disclaimer' {
      Panel {
          $Text = Get-Content -Path $disclaimerFile
          Table -DataTable $Text -HideFooter

        }
      }
    }

}