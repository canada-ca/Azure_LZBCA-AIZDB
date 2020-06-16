resource "azurerm_virtual_machine" "LzPcSWA-ADDS01" {

name = "LzPcSWA-ADDS01"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcSWA-ADDS01-nic1.id]
availability_set_id = azurerm_availability_set.LzPcSWA-ADDS-as.id
vm_size = "Standard_D2s_v3"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcSWA-ADDS01"
admin_username = "adadmin"
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
}


storage_os_disk {
name = "LzPcSWA-ADDS01-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Windows"
}


storage_data_disk {
name = "LzPcSWA-ADDS01-Datadisk1"
lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "10"
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

resource "azurerm_virtual_machine" "LzPcSWA-ADDS02" {

name = "LzPcSWA-ADDS02"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcSWA-ADDS02-nic1.id]
availability_set_id = azurerm_availability_set.LzPcSWA-ADDS-as.id
vm_size = "Standard_D2s_v3"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcSWA-ADDS02"
admin_username = "adadmin"
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
}


storage_os_disk {
name = "LzPcSWA-ADDS02-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Windows"
}


storage_data_disk {
name = "LzPcSWA-ADDS02-Datadisk1"
lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "10"
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

resource "azurerm_virtual_machine" "LzPcSWJ-RDSH01" {

name = "LzPcSWJ-RDSH01"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcSWJ-RDSH01-nic1.id]
availability_set_id = azurerm_availability_set.LzPcSWJ-RDSH-as.id
vm_size = "Standard_D2s_v3"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcSWA-RDSH01"
admin_username = "rdsadmin"
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
}


storage_os_disk {
name = "LzPcSWJ-RDSH01-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Windows"
}


storage_data_disk {
name = "LzPcSWJ-RDSH01-Datadisk1"
lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "10"
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

resource "azurerm_virtual_machine" "LzPcSWJ-RDSH02" {

name = "LzPcSWJ-RDSH02"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcSWJ-RDSH02-nic1.id]
availability_set_id = azurerm_availability_set.LzPcSWJ-RDSH-as.id
vm_size = "Standard_D2s_v3"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcSWA-RDSH02"
admin_username = "rdsadmin"
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
}


storage_os_disk {
name = "LzPcSWJ-RDSH02-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Windows"
}


storage_data_disk {
name = "LzPcSWJ-RDSH02-Datadisk1"
lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "10"
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

resource "azurerm_virtual_machine" "LzPcSWE-MGMT01" {

name = "LzPcSWE-MGMT01"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcSWE-MGMT01-nic1.id]
availability_set_id = azurerm_availability_set.LzPcSWE-MGMT-as.id
vm_size = "Standard_D2s_v3"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"

os_profile {
computer_name = "LzPcSWE-MGMT01"
admin_username = "mgmtadmin"
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
}


storage_os_disk {
name = "LzPcSWE-MGMT01-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Windows"
}


storage_data_disk {
name = "LzPcSWE-MGMT01-Datadisk1"
lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "10"
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

