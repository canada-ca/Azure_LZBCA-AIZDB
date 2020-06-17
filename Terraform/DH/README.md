# Deployment Host Steps

* Update the config.tf with enviornemnt settings and access values
* Replace line 104 in deployment_host.tf with your source IP - source_address_prefixes = ["ENTER YOUR SOURCE IP"]- (this is a public IP)
* Update variables.tf as required
* Save changes and run Terraform Init
* Run Terraform plan and review
* Run Terraform apply and review
* Log into the Deployment Host
* Execute "SetupDeploymentHost.ps1" as an administrator
* Execute "installVSCextensions.bat"
* Launch VS Code and verify environment
  
 # Note:
  First Terraform apply may return a policy error if PBMM Blueprint is assigned in the target subscription. Open Azure portal, navigate to policies/assignments and locate the "Network interfaces should not have public IPs" policy. Exclude the newly create LzPc-Deployment_Host-rg and re-run the Terraform apply. This will be automated in Release 2c...

  