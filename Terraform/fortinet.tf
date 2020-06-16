
resource "azurerm_virtual_machine" "LzPcFWL-FGVM01" {

name = "LzPcFWL-FGVM01"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcFWL-FGVM01-nic1.id, azurerm_network_interface.LzPcFWL-FGVM01-nic2.id, azurerm_network_interface.LzPcFWL-FGVM01-nic3.id, azurerm_network_interface.LzPcFWL-FGVM01-nic4.id, azurerm_network_interface.LzPcFWL-FGVM01-nic5.id, azurerm_network_interface.LzPcFWL-FGVM01-nic6.id, azurerm_network_interface.LzPcFWL-FGVM01-nic7.id]
primary_network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic1.id
availability_set_id = azurerm_availability_set.LzPcFWL-FGVM-as.id
vm_size = "standard_f8s"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcFWL-FGVM01"
admin_username = "fgadmin"
admin_password = "Canada1!"
custom_data  = data.template_file.fg1_custom_data.rendered
}



storage_image_reference {
publisher = "fortinet"
offer     = "fortinet_fortigate-vm_v5"
sku       = "fortinet_fg-vm"
version   = "6.2.3"
}


plan {
name      = "fortinet_fg-vm"
publisher = "fortinet"
product   = "fortinet_fortigate-vm_v5"
}


os_profile_linux_config {
disable_password_authentication = false
}



storage_os_disk {
name = "LzPcFWL-FGVM01-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Linux"
disk_size_gb  = "2"
}


storage_data_disk {
name = "LzPcFWL-FGVM01-Datadisk1"

lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "30"
}

boot_diagnostics {
enabled     = true
storage_uri = "https://lzpccsalzdeployr2c.blob.core.windows.net/"
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

resource "azurerm_virtual_machine" "LzPcFWL-FGVM02" {

name = "LzPcFWL-FGVM02"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcFWL-FGVM02-nic1.id, azurerm_network_interface.LzPcFWL-FGVM02-nic2.id, azurerm_network_interface.LzPcFWL-FGVM02-nic3.id, azurerm_network_interface.LzPcFWL-FGVM02-nic4.id, azurerm_network_interface.LzPcFWL-FGVM02-nic5.id, azurerm_network_interface.LzPcFWL-FGVM02-nic6.id, azurerm_network_interface.LzPcFWL-FGVM02-nic7.id]
primary_network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic1.id
availability_set_id = azurerm_availability_set.LzPcFWL-FGVM-as.id
vm_size = "standard_f8s"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"


os_profile {
computer_name = "LzPcFWL-FGVM02"
admin_username = "fgadmin"
admin_password = "Canada1!"
custom_data  = data.template_file.fg2_custom_data.rendered
}



storage_image_reference {
publisher = "fortinet"
offer     = "fortinet_fortigate-vm_v5"
sku       = "fortinet_fg-vm"
version   = "6.2.3"
}


plan {
name      = "fortinet_fg-vm"
publisher = "fortinet"
product   = "fortinet_fortigate-vm_v5"
}


os_profile_linux_config {
disable_password_authentication = false
}



storage_os_disk {
name = "LzPcFWL-FGVM02-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Linux"
disk_size_gb  = "2"
}


storage_data_disk {
name = "LzPcFWL-FGVM02-Datadisk1"

lun           = 0
caching       = "None"
create_option = "Empty"
disk_size_gb  = "30"
}

boot_diagnostics {
enabled     = true
storage_uri = "https://lzpccsalzdeployr2c.blob.core.windows.net/"
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

