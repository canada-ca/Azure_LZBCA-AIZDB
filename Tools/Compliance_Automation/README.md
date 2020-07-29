# Premise
Cloud R&D Azure team has created a standalone PowerShell based automation tool that extracts evidence for specific [automation eligible] controls of the 30 day guardrails / PBMM compliance and provides remediation steps as needed. The tool  provide coverage of the technical 30 day guardrails only. Please see attached a deck for an overview of what was accomplished. 

The collected evidence is extremely detailed and feeds directly into acceleration of the SA&A / ATO process.

The script generates HTML based evidence report for guardrails policy implementations. Please change ENV variables and Subscription ID before executing the script. 

# Powershell Prerequisites
These modules must be installed to run the tool.
* Az [Install-Module -Name Az -AllowClobber -Scope CurrentUser]
* PSWriteHTML
* MSolService (This is required to verify Multi factor Authentication) 
The tool requires Azure login via 'az login' prior to execution. 

# Existing Features

* Covers validation gaps in Azure portal compliance tools
* Gathers actual evidence data from target Azure subscription[s]
* Remediation steps provided for passed, failed and manual results
* Findings are fed back into master Office365 guardrails document
* Leverages CIS and other best practices for validation
* Leverages PowerShell scripts and Azure API interfaces

# Future enhancements

The tool can be invoked for any Azure subscription in any tenant. There are plans in place to introduce the following advanced features in the near future.

* Multi-tenant multi-subscription wrapper - can be integrated into automated monitoring systems
* Integrated email reports for non-compliant tenants / subscriptions
* PowerBI analysis across multiple reports including trend identification
* To be extended to full PBMM guardrails controls
* Can be integrated into Cloud Management Platform tools and scheduled automation tasks

# Potential clients

The following parties will derive value from this tool, in particular for the validation and verification for all tenants / subscriptions under their jurisdiction. This includes compliance and security monitoring / validation. 

* SSC CTO Cloud R&D
* SSC CIO
* SSC SM&G
* SSC Cloud Broker
* Partner departments, e.g. Global Affairs
* Operational teams, e.g. integration to Cloud Operating Model

We are happy to provide a demo on the tool to whomever is interested and to work with the Cloud Broker team to facilitate their validation of the compliance and security monitoring for Azure tenants.

# Jira Tasks

* https://jira-cloud.internal.ssccentral.prod.azs.cloud-nuage.gc.ca/browse/AZURELZ-62

# OneNote

* https://synergi.ssc-spc.gc.ca/PB/CloudResearch/_layouts/OneNote.aspx?id=%2FPB%2FCloudResearch%2FDocument%20Library%2FCloud%20R%26D&wd=target%28Azure%20LZ-BCA.one%7C49C2D658-C807-46BC-BCE4-4C2AB97B7236%2FGuardrails%20Compliance%20Evidence%20Automation%7C97E65538-82CC-40A8-BBFA-68EB638558B6%2F%29
* onenote:https://synergi.ssc-spc.gc.ca/PB/CloudResearch/Document%20Library/Cloud%20R&D/Azure%20LZ-BCA.one#Guardrails%20Compliance%20Evidence%20Automation&section-id={49C2D658-C807-46BC-BCE4-4C2AB97B7236}&page-id={97E65538-82CC-40A8-BBFA-68EB638558B6}&end
