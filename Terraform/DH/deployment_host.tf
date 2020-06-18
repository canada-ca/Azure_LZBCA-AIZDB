resource "azurerm_resource_group" "LzDc-Deployment_Host-rg" {

name     = "LzDc-Deployment_Host-rg"
location = "canadaCentral"
provider = azurerm.LzDc-PBMMCore
tags = var.tags
}

resource "azurerm_virtual_network" "LzDcCNR-Deployment_Host-vnet" {

name     = "LzDcCNR-Deployment_Host-vnet"
location = "canadaCentral"
address_space = ["10.0.0.0/24"]
resource_group_name   = azurerm_resource_group.LzDc-Deployment_Host-rg.name
provider = azurerm.LzDc-PBMMCore
tags = var.tags
}

resource "azurerm_subnet" "LzDcCNR-Deployment_Host-snet" {

name     = "LzDcCNR-Deployment_Host-snet"
address_prefix = "10.0.0.0/26"
resource_group_name   = azurerm_resource_group.LzDc-Deployment_Host-rg.name
virtual_network_name = azurerm_virtual_network.LzDcCNR-Deployment_Host-vnet.name
provider = azurerm.LzDc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzDcCNR-Deployment_Host-nsg.id
}

resource "azurerm_virtual_machine" "LzDcSWE-DH01" {
    name                  = "LzDcSWE-DH01"
    location              = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzDc-Deployment_Host-rg.name
    provider = azurerm.LzDc-PBMMCore
    network_interface_ids = [azurerm_network_interface.LzDcSWE-DH01-nic1.id]
    vm_size               = "Standard_DS2_v2"
    delete_data_disks_on_termination = "true"
    delete_os_disk_on_termination    = "true"
    os_profile {
        computer_name  = "LzDcSWE-DH01"
        admin_username = var.admin
        admin_password = var.password
    }
    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }
    os_profile_windows_config {
        provision_vm_agent = true
        enable_automatic_upgrades = true
    }
    storage_os_disk {
        name          = "LzDcSWE-DH01-OSdisk1"
        caching       = "ReadWrite"
        create_option = "FromImage"
        os_type       = "Windows"
    }
tags = var.tags
}

resource "azurerm_network_interface" "LzDcSWE-DH01-nic1" {
    name= "LzDcSWE-DH01-nic1"
    location = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzDc-Deployment_Host-rg.name
    provider = azurerm.LzDc-PBMMCore
    enable_ip_forwarding = "false"
    enable_accelerated_networking = "false"
    
    ip_configuration {
        name = "LzDcSWE-DH01-nic1-config"
        subnet_id = azurerm_subnet.LzDcCNR-Deployment_Host-snet.id
        private_ip_address = "10.0.0.10"
        private_ip_address_allocation = "static"
        primary = "true"
        public_ip_address_id = azurerm_public_ip.LzDcSWE-DH01-pip1.id
    }
}

resource "azurerm_public_ip" "LzDcSWE-DH01-pip1" {
    name= "LzDcSWE-DH01-pip1"
    location = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzDc-Deployment_Host-rg.name
    provider = azurerm.LzDc-PBMMCore
    allocation_method = "Static"
    tags = var.tags
}

resource "azurerm_network_security_group" "LzDcCNR-Deployment_Host-nsg" {

name = "LzDcCNR-Deployment_Host-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Deployment_Host-rg.name
provider = azurerm.LzDc-PBMMCore

security_rule {
name = "Allow_RDP"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389"]
source_address_prefixes = ["ENTER YOUR SOURCE IP"]
destination_address_prefix = "*"
description = "Allow_RDP"
}
tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-Deployment_Host-nsg-LzDcCNR-Deployment_Host-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Deployment_Host-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Deployment_Host-nsg.id
provider = azurerm.LzDc-PBMMCore
}

output "LzPcSWE-DHF01-pip1" { value = azurerm_public_ip.LzDcSWE-DH01-pip1.ip_address}
