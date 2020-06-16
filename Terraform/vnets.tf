resource "azurerm_virtual_network" "LzDcCNR-Dev_PAZ-vnet" {

name     = "LzDcCNR-Dev_PAZ-vnet"
location = "canadaCentral"
address_space = ["172.17.224.0/20"]
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_virtual_network" "LzDcCNR-Dev-vnet" {

name     = "LzDcCNR-Dev-vnet"
location = "canadaCentral"
address_space = ["172.17.64.0/20"]
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_virtual_network" "LzPcCNR-Core-vnet" {

name     = "LzPcCNR-Core-vnet"
location = "canadaCentral"
address_space = ["172.16.0.0/20"]
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_virtual_network" "LzPcCNR-MRZ-vnet" {

name     = "LzPcCNR-MRZ-vnet"
location = "canadaCentral"
address_space = ["172.16.32.0/20"]
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_virtual_network" "LzPcCNR-Prod_PAZ-vnet" {

name     = "LzPcCNR-Prod_PAZ-vnet"
location = "canadaCentral"
address_space = ["172.16.224.0/20"]
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_virtual_network" "LzPcCNR-Prod-vnet" {

name     = "LzPcCNR-Prod-vnet"
location = "canadaCentral"
address_space = ["172.16.64.0/20"]
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

