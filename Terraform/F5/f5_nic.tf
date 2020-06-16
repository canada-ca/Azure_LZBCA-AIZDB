resource "azurerm_network_interface" "LzPcADC-F5VM01-nic1" {

name = "LzPcADC-F5VM01-nic1"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM01-nic1-config"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-MGMT-snet.id
private_ip_address = "172.16.5.11"
private_ip_address_allocation = "static"
public_ip_address_id = azurerm_public_ip.LzPcADC-F5VM01-pip1.id
primary = "true"
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

resource "azurerm_network_interface" "LzPcADC-F5VM01-nic2" {

name = "LzPcADC-F5VM01-nic2"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
network_security_group_id = azurerm_network_security_group.LzPcADC-F5VMEXT-nsg.id
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM01-nic2-config1"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-External-snet.id
private_ip_address = "172.16.0.11"
private_ip_address_allocation = "static"
primary = "true"
}

ip_configuration {
name = "LzPcADC-F5VM01-nic2-config2"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-External-snet.id
private_ip_address = "172.16.0.13"
private_ip_address_allocation = "static"
primary = "false"
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


resource "azurerm_network_interface" "LzPcADC-F5VM01-nic3" {

name = "LzPcADC-F5VM01-nic3"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
network_security_group_id = azurerm_network_security_group.LzPcADC-F5VMINT-nsg.id
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM01-nic3-config1"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.11"
private_ip_address_allocation = "static"
primary = "true"
}

ip_configuration {
name = "LzPcADC-F5VM01-nic3-config2"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.13"
private_ip_address_allocation = "static"
primary = "false"
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

resource "azurerm_network_interface" "LzPcADC-F5VM02-nic1" {

name = "LzPcADC-F5VM02-nic1"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM02-nic1-config"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-MGMT-snet.id
private_ip_address = "172.16.5.12"
private_ip_address_allocation = "static"
public_ip_address_id = azurerm_public_ip.LzPcADC-F5VM02-pip1.id
primary = "true"
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

resource "azurerm_network_interface" "LzPcADC-F5VM02-nic2" {

name = "LzPcADC-F5VM02-nic2"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
network_security_group_id = azurerm_network_security_group.LzPcADC-F5VMEXT-nsg.id
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM02-nic2-config1"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-External-snet.id
private_ip_address = "172.16.0.12"
private_ip_address_allocation = "static"
primary = "true"
}

ip_configuration {
name = "LzPcADC-F5VM02-nic2-config2"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-External-snet.id
private_ip_address = "172.16.0.14"
private_ip_address_allocation = "static"
primary = "false"
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

resource "azurerm_network_interface" "LzPcADC-F5VM02-nic3" {

name = "LzPcADC-F5VM02-nic3"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
network_security_group_id = azurerm_network_security_group.LzPcADC-F5VMINT-nsg.id
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcADC-F5VM02-nic3-config1"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.12"
private_ip_address_allocation = "static"
primary = "true"
}

ip_configuration {
name = "LzPcADC-F5VM02-nic3-config2"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.14"
private_ip_address_allocation = "static"
primary = "false"
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
