resource "azurerm_virtual_network_peering" "LzDcCNR-Dev-vnet-LzPcCNR-Core-vnet-gwp" {

name = "LzDcCNR-Dev-vnet-LzPcCNR-Core-vnet-gwp"
provider = azurerm.LzDc-PBMMDevelopment
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Core-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzDcCNR-Dev_PAZ-vnet-LzPcCNR-Core-vnet-gwp" {

name = "LzDcCNR-Dev_PAZ-vnet-LzPcCNR-Core-vnet-gwp"
provider = azurerm.LzDc-PBMMDevelopment
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Dev_PAZ-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Core-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-MRZ-vnet-LzPcCNR-Core-vnet-gwp" {

name = "LzPcCNR-MRZ-vnet-LzPcCNR-Core-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-MRZ-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Core-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Prod-vnet-LzPcCNR-Core-vnet-gwp" {

name = "LzPcCNR-Prod-vnet-LzPcCNR-Core-vnet-gwp"
provider = azurerm.LzPc-PBMMProduction
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Core-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Prod_PAZ-vnet-LzPcCNR-Core-vnet-gwp" {

name = "LzPcCNR-Prod_PAZ-vnet-LzPcCNR-Core-vnet-gwp"
provider = azurerm.LzPc-PBMMProduction
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Prod_PAZ-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Core-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Core-vnet-LzDcCNR-Dev-vnet-gwp" {

name = "LzPcCNR-Core-vnet-LzDcCNR-Dev-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzDcCNR-Dev-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Core-vnet-LzDcCNR-Dev_PAZ-vnet-gwp" {

name = "LzPcCNR-Core-vnet-LzDcCNR-Dev_PAZ-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzDcCNR-Dev_PAZ-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Core-vnet-LzPcCNR-MRZ-vnet-gwp" {

name = "LzPcCNR-Core-vnet-LzPcCNR-MRZ-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-MRZ-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Core-vnet-LzPcCNR-Prod-vnet-gwp" {

name = "LzPcCNR-Core-vnet-LzPcCNR-Prod-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Prod-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

resource "azurerm_virtual_network_peering" "LzPcCNR-Core-vnet-LzPcCNR-Prod_PAZ-vnet-gwp" {

name = "LzPcCNR-Core-vnet-LzPcCNR-Prod_PAZ-vnet-gwp"
provider = azurerm.LzPc-PBMMCore
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
virtual_network_name = azurerm_virtual_network.LzPcCNR-Core-vnet.name
remote_virtual_network_id = azurerm_virtual_network.LzPcCNR-Prod_PAZ-vnet.id
allow_virtual_network_access = "true"
allow_forwarded_traffic = "true"
allow_gateway_transit = "false"
use_remote_gateways = "false"
}

