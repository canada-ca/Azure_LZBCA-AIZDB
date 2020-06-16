
variable "tags" {
    type = map
    default = {
        env="dev"
        costcenter="12345"
        classification="pbmm"
        owner="director.cloud@canada.ca"
        contact="tech.advisor@canada.ca"
        deployment="azure-lz-iac-2020-06-12"
    }
} 
variable "user" {
    type = string
    default = "dhadmin"
}
variable "password" {
    type = string
    default = "Canada1!"
}

resource "azurerm_resource_group" "LzPc-Deployment_Host-rg" {

name     = "LzPc-Deployment_Host-rg"
location = "canadaCentral"
provider = azurerm.LzPc-PBMMCore
tags = tags = var.tags
}

#-----------------------------------------------------------------------------------------#
resource "azurerm_virtual_machine" "ScPcSWE-DH01" {
    name                  = "ScPcSWE-DH01"
    location              = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzPc-Deployment_Host-rg.name
    provider = azurerm.ScPc-PBMMCTOCore
    network_interface_ids = [azurerm_network_interface.ScPcSWE-DH01-nic1.id]
    vm_size               = "Standard_DS2_v2"
    delete_data_disks_on_termination = "true"
    delete_os_disk_on_termination    = "true"
    os_profile {
        computer_name  = "ScPcSWE-DH01"
        admin_username = "dhadmin"
        admin_password = "Canada1!"
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
        name          = "ScPcSWE-DH01-OSdisk1"
        caching       = "ReadWrite"
        create_option = "FromImage"
        os_type       = "Windows"
    }
    
resource "azurerm_virtual_network" "LzDcCNR-Deployment_Host-vnet" {

name     = "LzDcCNR-Deployment_Host-vnet"
location = "canadaCentral"
address_space = ["10.0.0.0/24"]
resource_group_name   = azurerm_resource_group.LzPc-Deployment_Host-rg.name
provider = azurerm.LzDc-PBMMCore
tags = var.tags
}

resource "azurerm_subnet" "LzDcCNR-Deployment_Host-snet" {

name     = "LzDcCNR-Deployment_Host-snet"
address_prefix = "10.0.0.0/26"
resource_group_name   = azurerm_resource_group.LzPc-Deployment_Host-rg.name
virtual_network_name = azurerm_virtual_networkLzDcCNR-Deployment_Host-vnet.name
provider = azurerm.LzDc-PBMMCore
network_security_group_id = azurerm_network_security_group.LzPc-Deployment_Host-nsg.id
}

resource "azurerm_network_security_group" "LzDcCNR-Deployment_Host-nsg" {

name = "LzDcCNR-Deployment_Host-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDcCNR-Deployment_Host-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_RDP"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389"]
source_address_prefixes = ["ENTER INBOUND HOST IP"]
destination_address_prefix = "*"
description = "Allow_RDP"
}
tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "LzDcCNR-LzDcCNR-Deployment_Host-nsg-LzDcCNR-Deployment_Host-snet" {
subnet_id = azurerm_subnet.LzDcCNR-Deployment_Host-snet.id
network_security_group_id = azurerm_network_security_group.LzDcCNR-Deployment_Host-nsg.id
provider = azurerm.LzDc-PBMMCore
}
tags = var.tags
}
    
    /*
    provisioner "remote-exec" {
        connection {
            host = azurerm_public_ip.ScPcSWE-MGMT01-pip1.ip_address
            type     = "winrm"
            user     = var.user
            password = var.password
        }
        inline = ["powershell New-NetFirewallRule -DisplayName 'Azure Update Manager ICMP' -Direction 'Inbound' -Protocol 'ICMPv4' -Action 'Allow'"]
    }
    
    Add back in after testing 
# VM Windows - Extensions
#-----------------------------------------------------------------------------------------#
resource "azurerm_virtual_machine_extension" "oms_mma_windows" {
    name = "OMSExtension"
    location = "canadaCentral"
    resource_group_name = data.azurerm_resource_group.ScPc-System_Core-rg.name
    provider = azurerm.ScSc-CSD-VDC_R2a_DevTest-24049
    virtual_machine_name = azurerm_virtual_machine.ScPcSWE-FW01.name
    publisher = "Microsoft.EnterpriseCloud.Monitoring"
    type = "MicrosoftMonitoringAgent"
    type_handler_version = "1.0"
    auto_upgrade_minor_version = true
    settings = <<-BASE_SETTINGS
    {
        "workspaceId" : "${data.azurerm_log_analytics_workspace.ScSc-UpdMgrA-law.workspace_id}"
    }
    BASE_SETTINGS
    protected_settings = <<-PROTECTED_SETTINGS
    {
        "workspaceKey" : "${data.azurerm_log_analytics_workspace.ScSc-UpdMgrA-law.primary_shared_key}"
    }
    PROTECTED_SETTINGS
}
*/

# VM Windows - NIC
#-----------------------------------------------------------------------------------------#
resource "azurerm_network_interface" "ScPcSWE-DH01-nic1" {
    name= "ScPcSWE-DH01-nic1"
    location = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzPc-Deployment_Host-rg.name
    provider = azurerm.ScPc-PBMMCTOCore
    enable_ip_forwarding = "false"
    enable_accelerated_networking = "false"
    ip_configuration {
        name = "ScPcSWE-DH01-nic1-config"
        subnet_id = data.azurerm_subnet.ScPcCNR-MRZ-OOB-snet.id
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = azurerm_public_ip.ScPcSWE-FW01-pip1.id
    }
     tags = var.tags
}

# VM Windows - PIP
#-----------------------------------------------------------------------------------------#
resource "azurerm_public_ip" "ScPcSWE-DH01-pip1" {
    name= "ScPcSWE-DH01-pip1"
    location = "canadaCentral"
    resource_group_name   = azurerm_resource_group.LzPc-Deployment_Host-rg.name
    provider = azurerm.ScPc-PBMMCTOCore
    allocation_method = "Static"
    tags = var.tags
}
*/
