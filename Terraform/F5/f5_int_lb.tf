// Internal LB
resource "azurerm_lb" "LzPcADC-F5Int-lb" {

name = "LzPcADC-F5Int-lb"
location = "canadaCentral"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
sku = "Standard"

frontend_ip_configuration {
name = "LzPcADC-F5Int-lbfe"
subnet_id = data.azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address_allocation = "Static"
private_ip_address = "172.16.1.10"
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

resource "azurerm_lb_backend_address_pool" "LzPcADC-F5Int-lbbp" {

name = "LzPcADC-F5Int-lbbp"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Int-lb.id


}


resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Int-lbbpa1" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM01-nic3.id
ip_configuration_name = "LzPcADC-F5VM01-nic3-config2"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Int-lbbp.id

}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcADC-F5Int-lbbpa2" {
provider = azurerm.LzPc-PBMMCore
network_interface_id = azurerm_network_interface.LzPcADC-F5VM02-nic3.id
ip_configuration_name = "LzPcADC-F5VM02-nic3-config2"
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Int-lbbp.id

}


resource "azurerm_lb_probe" "LzPcADC-F5Int-lbhp" {

name = "tcpProbe"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Int-lb.id
protocol = "tcp"
port = 59420
interval_in_seconds = 5
number_of_probes = 2


}

resource "azurerm_lb_rule" "LzPcADC-F5Int-lbr" {

name = "LzPcADC-F5Int-lbr"
resource_group_name = data.azurerm_resource_group.LzPc-Security_Core_External-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcADC-F5Int-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcADC-F5Int-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcADC-F5Int-lbbp.id
probe_id = azurerm_lb_probe.LzPcADC-F5Int-lbhp.id
depends_on = [azurerm_lb_probe.LzPcADC-F5Int-lbhp]
}


