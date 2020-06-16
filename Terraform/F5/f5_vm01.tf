resource "azurerm_virtual_machine" "LzPcADC-F5VM01" {

name = "LzPcADC-F5VM01"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
network_interface_ids = [azurerm_network_interface.LzPcADC-F5VM01-nic1.id, azurerm_network_interface.LzPcADC-F5VM01-nic2.id, azurerm_network_interface.LzPcADC-F5VM01-nic3.id]
primary_network_interface_id = azurerm_network_interface.LzPcADC-F5VM01-nic1.id
vm_size = "Standard_DS5_v2"
delete_data_disks_on_termination = "true"
delete_os_disk_on_termination    = "true"
availability_set_id = azurerm_availability_set.LzPcADC-F5VM-as.id

# disable destroy
#lifecycle {
#prevent_destroy = true
#}

os_profile {
computer_name = "LzPcADC-F5VM01"
admin_username = "admf5"
admin_password = "Canada1!"

# Rem out after deploy to stop rebuild cycle
custom_data = data.template_file.LzPcADC-F5VM-vm_onboard.rendered 

}

storage_image_reference {
publisher = "f5-networks"
offer     = "f5-big-ip-byol"
sku       = "f5-big-all-2slot-byol"
version   = "latest"
}

plan {
name      = "f5-big-all-2slot-byol"
publisher = "f5-networks"
product   = "f5-big-ip-byol"
}

os_profile_linux_config {
disable_password_authentication = false
}

storage_os_disk {
name = "LzPcADC-F5VM01-OSdisk1"
caching       = "ReadWrite"
create_option = "FromImage"
os_type       = "Linux"
managed_disk_type = "Standard_LRS"
disk_size_gb  = "120"
}

boot_diagnostics {
enabled = true
storage_uri = "https://lzpccsaf5bootdiaglz.blob.core.windows.net/"
}

#--------------------------------
provisioner "remote-exec" {
connection {
host     = azurerm_public_ip.LzPcADC-F5VM01-pip1.ip_address
type     = "ssh"
user     = "admf5"
password = "Canada1!"
}
when = destroy
inline = [
"echo y | tmsh revoke sys license"
]
on_failure = continue
}

tags = {
env="dev"
    costcenter="12345"
    classification="pbmm"
    owner="director.cloud@canada.ca"
    contact="tech.advisor@canada.ca"
    deployment="azure-lz-iac-2020-06-12"
    cloudusageprofile="3"
}

}

resource "azurerm_virtual_machine_extension" "LzPcADC-F5VM01-run_startup_cmd" {
    name = "LzPcADC-F5VM01-run_startup_cmd"
    depends_on = ["azurerm_virtual_machine.LzPcADC-F5VM01", "azurerm_virtual_machine.LzPcADC-F5VM02"]
    location = "canadaCentral"
    resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
    provider = azurerm.LzPc-PBMMCore
    virtual_machine_name = azurerm_virtual_machine.LzPcADC-F5VM01.name
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
        {
            "commandToExecute": "sleep 180; /bin/su -c 'bash /var/lib/waagent/CustomData 1' - admf5"
        }
    SETTINGS

    tags = {
        env="dev"
        costcenter="12345"
        classification="pbmm"
        owner="director.cloud@canada.ca"
        contact="tech.advisor@canada.ca"
        deployment="azure-lz-iac-2020-06-12"
        cloudusageprofile="3"
    }   
}

output "LzPcADC-F5VM01-pip1" { value = azurerm_public_ip.LzPcADC-F5VM01-pip1.ip_address}