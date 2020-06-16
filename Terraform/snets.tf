resource "azurerm_subnet" "LzDcCNR-Dev_PAZ-App-snet" {

name     = "LzDcCNR-Dev_PAZ-App-snet"
address_prefix = "172.17.225.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev_PAZ-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev_PAZ-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev_PAZ-App-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev_PAZ-App-nsg-LzDcCNR-Dev_PAZ-App-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev_PAZ-App-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev_PAZ-App-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzDcCNR-Dev_PAZ-FE-snet" {

name     = "LzDcCNR-Dev_PAZ-FE-snet"
address_prefix = "172.17.224.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev_PAZ-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev_PAZ-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev_PAZ-FE-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev_PAZ-FE-nsg-LzDcCNR-Dev_PAZ-FE-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev_PAZ-FE-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev_PAZ-FE-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzDcCNR-Dev-App-snet" {

name     = "LzDcCNR-Dev-App-snet"
address_prefix = "172.17.66.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-App-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev-App-nsg-LzDcCNR-Dev-App-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev-App-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-App-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzDcCNR-Dev-Data-snet" {

name     = "LzDcCNR-Dev-Data-snet"
address_prefix = "172.17.67.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-Data-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev-Data-nsg-LzDcCNR-Dev-Data-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev-Data-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-Data-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzDcCNR-Dev-FE-snet" {

name     = "LzDcCNR-Dev-FE-snet"
address_prefix = "172.17.64.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-FE-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev-FE-nsg-LzDcCNR-Dev-FE-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev-FE-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-FE-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzDcCNR-Dev-Pres-snet" {

name     = "LzDcCNR-Dev-Pres-snet"
address_prefix = "172.17.65.0/24"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev-vnet.name
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-Pres-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Dev-Pres-nsg-LzDcCNR-Dev-Pres-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Dev-Pres-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Dev-Pres-nsg.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet" "LzPcCNR-Core-External-snet" {

name     = "LzPcCNR-Core-External-snet"
address_prefix = "172.16.0.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-HA-snet" {

name     = "LzPcCNR-Core-HA-snet"
address_prefix = "172.16.15.128/28"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-Int_Dev-snet" {

name     = "LzPcCNR-Core-Int_Dev-snet"
address_prefix = "172.16.3.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-Int_Prod-snet" {

name     = "LzPcCNR-Core-Int_Prod-snet"
address_prefix = "172.16.2.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-InterVDOM-snet" {

name     = "LzPcCNR-Core-InterVDOM-snet"
address_prefix = "172.16.15.0/28"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-MRZ-snet" {

name     = "LzPcCNR-Core-MRZ-snet"
address_prefix = "172.16.4.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-MGMT-snet" {

name     = "LzPcCNR-Core-MGMT-snet"
address_prefix = "172.16.5.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Core-Transit-snet" {

name     = "LzPcCNR-Core-Transit-snet"
address_prefix = "172.16.1.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Core-Transit-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-MRZ-INF-snet" {

name     = "LzPcCNR-MRZ-INF-snet"
address_prefix = "172.16.33.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-INF-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-MRZ-INF-nsg-LzPcCNR-MRZ-INF-snet" {
subnet_id = azurerm_subnet.LzPcCNR-MRZ-INF-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-INF-nsg.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-MRZ-LOG-snet" {

name     = "LzPcCNR-MRZ-LOG-snet"
address_prefix = "172.16.35.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-LOG-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-MRZ-LOG-nsg-LzPcCNR-MRZ-LOG-snet" {
subnet_id = azurerm_subnet.LzPcCNR-MRZ-LOG-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-LOG-nsg.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-MRZ-MAZ-snet" {

name     = "LzPcCNR-MRZ-MAZ-snet"
address_prefix = "172.16.32.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-MAZ-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-MRZ-MAZ-nsg-LzPcCNR-MRZ-MAZ-snet" {
subnet_id = azurerm_subnet.LzPcCNR-MRZ-MAZ-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-MAZ-nsg.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-MRZ-SEC-snet" {

name     = "LzPcCNR-MRZ-SEC-snet"
address_prefix = "172.16.34.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-SEC-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-MRZ-SEC-nsg-LzPcCNR-MRZ-SEC-snet" {
subnet_id = azurerm_subnet.LzPcCNR-MRZ-SEC-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-MRZ-SEC-nsg.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-MRZ-MGMT-snet" {

name     = "LzPcCNR-MRZ-MGMT-snet"
address_prefix = "172.16.36.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet" "LzPcCNR-Prod_PAZ-App-snet" {

name     = "LzPcCNR-Prod_PAZ-App-snet"
address_prefix = "172.16.225.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod_PAZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod_PAZ-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod_PAZ-App-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod_PAZ-App-nsg-LzPcCNR-Prod_PAZ-App-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod_PAZ-App-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod_PAZ-App-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet" "LzPcCNR-Prod_PAZ-FE-snet" {

name     = "LzPcCNR-Prod_PAZ-FE-snet"
address_prefix = "172.16.224.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod_PAZ-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod_PAZ-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod_PAZ-FE-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod_PAZ-FE-nsg-LzPcCNR-Prod_PAZ-FE-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod_PAZ-FE-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod_PAZ-FE-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet" "LzPcCNR-Prod-App-snet" {

name     = "LzPcCNR-Prod-App-snet"
address_prefix = "172.16.66.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-App-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod-App-nsg-LzPcCNR-Prod-App-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod-App-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-App-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet" "LzPcCNR-Prod-Data-snet" {

name     = "LzPcCNR-Prod-Data-snet"
address_prefix = "172.16.67.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-Data-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod-Data-nsg-LzPcCNR-Prod-Data-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod-Data-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-Data-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet" "LzPcCNR-Prod-FE-snet" {

name     = "LzPcCNR-Prod-FE-snet"
address_prefix = "172.16.64.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-FE-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod-FE-nsg-LzPcCNR-Prod-FE-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod-FE-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-FE-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet" "LzPcCNR-Prod-Pres-snet" {

name     = "LzPcCNR-Prod-Pres-snet"
address_prefix = "172.16.65.0/24"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod-vnet.name
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-Pres-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LzPcCNR-Prod-Pres-nsg-LzPcCNR-Prod-Pres-snet" {
subnet_id = azurerm_subnet.LzPcCNR-Prod-Pres-snet.id
network_security_group_id = azurerm_network_security_group.LzPcCNR-Prod-Pres-nsg.id
provider = azurerm.LzPc-PBMMProduction
}

