resource "azurerm_resource_group" "LzPc-Network_Core-rg" {

name     = "LzPc-Network_Core-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-Security_Core-rg" {

name     = "LzPc-Security_Core-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-Security_Core_External-rg" {

name     = "LzPc-Security_Core_External-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-System_Core-rg" {

name     = "LzPc-System_Core-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-KeyVault_Core-rg" {

name     = "LzPc-KeyVault_Core-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzDc-Network_Dev-rg" {

name     = "LzDc-Network_Dev-rg"
location = "canadaCentral"
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzDc-Security_Dev-rg" {

name     = "LzDc-Security_Dev-rg"
location = "canadaCentral"
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzDc-System_Dev-rg" {

name     = "LzDc-System_Dev-rg"
location = "canadaCentral"
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzDc-KeyVault_Dev-rg" {

name     = "LzDc-KeyVault_Dev-rg"
location = "canadaCentral"
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-Network_Prod-rg" {

name     = "LzPc-Network_Prod-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-Security_Prod-rg" {

name     = "LzPc-Security_Prod-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-System_Prod-rg" {

name     = "LzPc-System_Prod-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

resource "azurerm_resource_group" "LzPc-KeyVault_Prod-rg" {

name     = "LzPc-KeyVault_Prod-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-11"

}


}

