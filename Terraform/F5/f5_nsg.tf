resource "azurerm_network_security_group" "LzPcADC-F5VMMGMT-nsg" {

name = "LzPcADC-F5VMMGMT-nsg"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_SSH"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "22"
source_address_prefixes = ["172.16.36.10", "172.16.36.11"]
destination_address_prefix = "*"
description = "Allow_SSH"
}

security_rule {
name = "Allow_HTTPS"
priority = "110"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "443"
source_address_prefixes = ["172.16.36.10", "172.16.36.11"]
destination_address_prefix = "*"
description = "Allow_HTTPS"
}

tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}


resource "azurerm_network_security_group" "LzPcADC-F5VMEXT-nsg" {

name = "LzPcADC-F5VMEXT-nsg"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_HealthProbe"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "59420"
source_address_prefix = "168.63.129.16"
destination_address_prefix = "*"
description = "Allow_LBHP"
}

security_rule {
name = "Allow_HTTPS"
priority = "110"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "443"
source_address_prefix = "*"
destination_address_prefix = "*"
description = "Allow_HTTPS"
}

security_rule {
name = "Allow_HTTPS_10443"
priority = "120"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "10443"
source_address_prefix = "*"
destination_address_prefix = "*"
description = "Allow_HTTPS_10443"
}


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}


resource "azurerm_network_security_group" "LzPcADC-F5VMINT-nsg" {

name = "LzPcADC-F5VMINT-nsg"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_HealthProbe"
priority = "110"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "59420"
source_address_prefix = "168.63.129.16"
destination_address_prefix = "*"
description = "Allow_HTTPS"
}

security_rule {
name = "Allow_All_TCP"
priority = "120"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_range = "*"
source_address_prefix = "*"
destination_address_prefix = "*"
description = "Allow_All_TCP"
}


tags = {
env="dev"
costcenter="12345"
classification="pbmm"
owner="director.cloud@canada.ca"
contact="tech.advisor@canada.ca"
deployment="azure-lz-iac-2020-06-12"

}


}
