# Data sources for F5 deployment
#-----------------------------------------------------------------------------------------#

data "azurerm_log_analytics_workspace" "LzPcCLD-CoreSecurity-law" {
  name                = "LzPcCLD-CoreSecurity-law"
  resource_group_name = "LzPc-Core_loganalytics-rg"
  provider = azurerm.LzPc-PBMMCore
}

data "azurerm_resource_group" "LzPc-Security_Core_External-rg" {
    name = "LzPc-Security_Core_External-rg"
    provider = azurerm.LzPc-PBMMCore
}
data "azurerm_resource_group" "LzPc-Network_Core-rg" {
    name = "LzPc-Network_Core-rg"
    provider = azurerm.LzPc-PBMMCore
}

data "azurerm_virtual_network" "LzPcCNR-Core-vnet" {
  name                 = "LzPcCNR-Core-vnet"
  resource_group_name  = data.azurerm_resource_group.LzPc-Network_Core-rg.name
  provider = azurerm.LzPc-PBMMCore
}

data "azurerm_subnet" "LzPcCNR-Core-MGMT-snet" {
  name                 = "LzPcCNR-Core-MGMT-snet"
  virtual_network_name = "LzPcCNR-Core-vnet"
  resource_group_name  = data.azurerm_resource_group.LzPc-Network_Core-rg.name
  provider = azurerm.LzPc-PBMMCore
}

data "azurerm_subnet" "LzPcCNR-Core-External-snet" {
  name                 = "LzPcCNR-Core-External-snet"
  virtual_network_name = "LzPcCNR-Core-vnet"
  resource_group_name  = data.azurerm_resource_group.LzPc-Network_Core-rg.name
  provider = azurerm.LzPc-PBMMCore
}

data "azurerm_subnet" "LzPcCNR-Core-Transit-snet" {
  name                 = "LzPcCNR-Core-Transit-snet"
  virtual_network_name = "LzPcCNR-Core-vnet"
  resource_group_name  = data.azurerm_resource_group.LzPc-Network_Core-rg.name
  provider = azurerm.LzPc-PBMMCore
}

