//External LB
resource "azurerm_lb" "LzPcADC-F5Ext-lb" {

name = "LzPcADC-F5Ext-lb"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
sku = "Standard"

frontend_ip_configuration {
name = "LzPcADC-F5Ext-Primary-lbfe"
public_ip_address_id = azurerm_public_ip.LzPcADC-F5Ext-pip1.id
}

frontend_ip_configuration {
name = "LzPcADC-F5Ext-NAT-lbfe"
public_ip_address_id = azurerm_public_ip.LzPcADC-F5Ext-pip2.id
}

frontend_ip_configuration {
name = "LzPcADC-F5Ext-App1-lbfe"
public_ip_address_id = azurerm_public_ip.LzPcADC-F5Ext-pip3.id
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

resource "azurerm_lb_backend_address_pool" "LzPcADC-F5Ext-Primary-lbbp" {

name = "LzPcADC-F5Ext-lbbp"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Ext-lbbpa1" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM01-nic2.id
ip_configuration_name = "LzPcADC-F5VM01-nic2-config2"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-Primary-lbbp.id
}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Ext-lbbpa2" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM02-nic2.id
ip_configuration_name = "LzPcADC-F5VM02-nic2-config2"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-Primary-lbbp.id
}

resource "azurerm_lb_probe" "LzPcADC-F5Ext-lbhp" {

name = "LzPcADC-F5Ext-lbhp"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
protocol = "tcp"
port = 59420
interval_in_seconds = 5
number_of_probes = 2
}

resource "azurerm_lb_rule" "LzPcADC-F5Ext-lbr1" {

name = "LzPcADC-F5Ext-lbr1"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
protocol = "tcp"
frontend_port = 443
backend_port = 10443
frontend_ip_configuration_name = "LzPcADC-F5Ext-Primary-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-Primary-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcADC-F5Ext-lbhp.id
depends_on = [azurerm_lb_probe.LzPcADC-F5Ext-lbhp]
}

resource "azurerm_lb_rule" "LzPcADC-F5Ext-lbr2" {

name = "LzPcADC-F5Ext-lbr2"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
protocol = "tcp"
frontend_port = 443
backend_port = 20001
frontend_ip_configuration_name = "LzPcADC-F5Ext-App1-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-Primary-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcADC-F5Ext-lbhp.id
depends_on = [azurerm_lb_probe.LzPcADC-F5Ext-lbhp]
}

//outbound NAT controls

resource "azurerm_lb_backend_address_pool" "LzPcADC-F5Ext-NAT-lbbp" {

name = "LzPcADC-F5Ext_NAT-lbbp"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Ext_NAT-lbbpa1" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM01-nic2.id
ip_configuration_name = "LzPcADC-F5VM01-nic2-config1"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-NAT-lbbp.id
}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Ext_NAT-lbbpa2" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM02-nic2.id
ip_configuration_name = "LzPcADC-F5VM02-nic2-config1"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-NAT-lbbp.id
}

resource "azurerm_lb_outbound_rule" "LzPcADC-F5Ext-lbr2" {
    name = "LzPcADC-F5Ext-lbr2"
    resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
    provider = azurerm.LzPc-PBMMCore
    loadbalancer_id = azurerm_lb.LzPcADC-F5Ext-lb.id
    backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Ext-NAT-lbbp.id
    idle_timeout_in_minutes = 5
    protocol = "All"
    frontend_ip_configuration {
        name = "LzPcADC-F5Ext-NAT-lbfe"
    }
}

output "LzPcADC-F5Ext-pip1" { value = azurerm_public_ip.LzPcADC-F5Ext-pip1.ip_address}
