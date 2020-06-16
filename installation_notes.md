

# **------------Remote State Configuration--------------------**

This deployment is set to default local state but files are provided to manage remote state:
``` 
C:\Temp2\terraform_remote_blob.tf
C:\Temp2\terraform_remote_backend.tf_
```
First deploy the infrastructure with to create all elements including required remote storage.
```
terraform plan
terraform apply
```

Then login to Azure portal and browse to the storage container and retrieve the access key to place into:
```
C:\Temp2\terraform_remote_backend.tf_
```
To activate remote state rename:
```
.tf_ to .tf
```
Run
```
terraform init
terraform plan
terraform apply
C:\Temp2\terraform_remote_backend.tf_
```

# **-----------------Secret key file------------------------**

Please note for access to the tenant a separate file is expected as follows:
```
C:\Temp2\keys.csv
```
This file should contain the following variables in csv format:
``` 
client_id,value
client_secret,value
tenant_id,value
```

# **------------Fortinet Firewall licenses--------------------**

Please be sure to run the following script to prepare the subscriptions to issue Fortinet firewall licenses:
```
azuremarketplace.ps1
```

Licenses can be received via registration and download at https://support.fortinet.com/

# **-----------Fortinet Firewall Configuration----------------**

The default fortinet configuration will be deployed using customdata.tpl and variables defined in the Fortinet terraform file. 

```
** Warning - importing this file will overwrite all default settings such as login/password, networks, etc. **
```

# **-------------Azure LZ Reporting Tool----------------------**

Luc St-Jean in CPMSD has developed a comprehensive Azure reporting tool that gathers critical data from the Azure tenant and subscription.

For details please Tools\Azure_LZ_Reporting_Tool subfolder. 

# **--------Deployment Host / Visual Studio Code Setup--------**

To facilitate setup of the intended deployment host please use script:
```
SetupDeploymentHost.ps1
```

To facilitate customization of Visual Studio code please use script:
```
installVSCextensions.bat
```
