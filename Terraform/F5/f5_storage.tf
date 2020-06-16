resource "azurerm_storage_account" "lzpccsaf5bootdiaglz" {

name     = "lzpccsaf5bootdiaglz"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
location = "canadaCentral"
account_tier             = "standard"  
account_replication_type = "LRS"


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}
#lifecycle {
#prevent_destroy = true
#}
}

resource "azurerm_storage_container" "lzpccsaf5bootdiaglzcont" {

name     = "lzpccsaf5bootdiaglzcont"
storage_account_name  = azurerm_storage_account.lzpccsaf5bootdiaglz.name
provider = azurerm.LzPc-PBMMCore
container_access_type = "private"
#lifecycle {
#prevent_destroy = true
#}


}
