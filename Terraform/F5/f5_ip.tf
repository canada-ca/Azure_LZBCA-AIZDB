
resource "azurerm_public_ip" "LzPcADC-F5VM01-pip1" {

name = "LzPcADC-F5VM01-pip1"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
allocation_method = "Static"
sku = "Standard"

tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_public_ip" "LzPcADC-F5VM02-pip1" {

name = "LzPcADC-F5VM02-pip1"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
allocation_method = "Static"
sku = "Standard"

tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"
}
}

resource "azurerm_public_ip" "LzPcADC-F5Ext-pip1" {

name = "LzPcADC-F5Ext-pip1"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
allocation_method = "Static"
sku = "Standard"
tags = {
    env="dev"
    costcenter="12345"
    classification="pbmm"
    owner="director.cloud@canada.ca"
    contact="tech.advisor@canada.ca"
    deployment="azure-lz-iac-2020-06-12"
    cloudusageprofile="3"
    }
}

resource "azurerm_public_ip" "LzPcADC-F5Ext-pip2" {

name = "LzPcADC-F5Ext-pip2"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
allocation_method = "Static"
sku = "Standard"
tags = {
    env="dev"
    costcenter="12345"
    classification="pbmm"
    owner="director.cloud@canada.ca"
    contact="tech.advisor@canada.ca"
    deployment="azure-lz-iac-2020-06-12"
    cloudusageprofile="3"
    }
}

resource "azurerm_public_ip" "LzPcADC-F5Ext-pip3" {

name = "LzPcADC-F5Ext-pip3"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
allocation_method = "Static"
sku = "Standard"
tags = {
    env="dev"
    costcenter="12345"
    classification="pbmm"
    owner="director.cloud@canada.ca"
    contact="tech.advisor@canada.ca"
    deployment="azure-lz-iac-2020-06-12"
    cloudusageprofile="3"
    }
}