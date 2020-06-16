resource "azurerm_availability_set" "LzPcADC-F5VM-as" {

name = "LzPcADC-F5VM-as"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
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
