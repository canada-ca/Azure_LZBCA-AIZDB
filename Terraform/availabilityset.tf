resource "azurerm_availability_set" "LzPcSWA-ADDS-as" {

name = "LzPcSWA-ADDS-as"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore


platform_fault_domain_count = "2"
platform_update_domain_count = "3"
managed = "true"


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_availability_set" "LzPcSWJ-RDSH-as" {

name = "LzPcSWJ-RDSH-as"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore


platform_fault_domain_count = "2"
platform_update_domain_count = "3"
managed = "true"


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_availability_set" "LzPcFWL-FGVM-as" {

name = "LzPcFWL-FGVM-as"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore


platform_fault_domain_count = "2"
platform_update_domain_count = "2"
managed = "true"


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}

resource "azurerm_availability_set" "LzPcSWE-MGMT-as" {

name = "LzPcSWE-MGMT-as"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore


platform_fault_domain_count = "2"
platform_update_domain_count = "3"
managed = "true"


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}