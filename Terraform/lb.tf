
resource "azurerm_lb" "LzPcFWL-FGVM-lb" {

name = "LzPcFWL-FGVM-lb"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
sku = "standard"


frontend_ip_configuration {
name = "LzPcFWL-FGVM-Transit_Prod-lbfe"
private_ip_address_allocation = "static"
private_ip_address = "172.16.1.20"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id

}
frontend_ip_configuration {
name = "LzPcFWL-FGVM-Transit_Dev-lbfe"
private_ip_address_allocation = "static"
private_ip_address = "172.16.1.30"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id

}
frontend_ip_configuration {
name = "LzPcFWL-FGVM-Core-Int_Prod-lbfe"
private_ip_address_allocation = "static"
private_ip_address = "172.16.2.10"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.id

}
frontend_ip_configuration {
name = "LzPcFWL-FGVM-Core-Int_Dev-lbfe"
private_ip_address_allocation = "static"
private_ip_address = "172.16.3.10"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.id

}
frontend_ip_configuration {
name = "LzPcFWL-FGVM-Core-MRZ-lbfe"
private_ip_address_allocation = "static"
private_ip_address = "172.16.4.10"
subnet_id = azurerm_subnet.LzPcCNR-Core-MRZ-snet.id

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


resource "azurerm_lb_backend_address_pool" "LzPcFWL-FGVM-Transit_Prod-lbbp" {

name = "LzPcFWL-FGVM-Transit_Prod-lbbp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id


}

resource "azurerm_lb_backend_address_pool" "LzPcFWL-FGVM-Transit_Dev-lbbp" {

name = "LzPcFWL-FGVM-Transit_Dev-lbbp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id


}

resource "azurerm_lb_backend_address_pool" "LzPcFWL-FGVM-Int_Prod-lbbp" {

name = "LzPcFWL-FGVM-Int_Prod-lbbp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id


}

resource "azurerm_lb_backend_address_pool" "LzPcFWL-FGVM-Int_Dev-lbbp" {

name = "LzPcFWL-FGVM-Int_Dev-lbbp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id


}

resource "azurerm_lb_backend_address_pool" "LzPcFWL-FGVM-MRZ-lbbp" {

name = "LzPcFWL-FGVM-MRZ-lbbp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Transit_Prod-lbbpa1" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic1.id
ip_configuration_name = "LzPcFWL-FGVM01-nic1-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Prod-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Transit_Prod-lbbpa2" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic1.id
ip_configuration_name = "LzPcFWL-FGVM02-nic1-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Prod-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Transit_Dev-lbbpa1" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic6.id
ip_configuration_name = "LzPcFWL-FGVM01-nic6-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Dev-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Transit_Dev-lbbpa2" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic6.id
ip_configuration_name = "LzPcFWL-FGVM02-nic6-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Dev-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Int_Prod-lbbpa1" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic4.id
ip_configuration_name = "LzPcFWL-FGVM01-nic4-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Prod-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Int_Prod-lbbpa2" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic4.id
ip_configuration_name = "LzPcFWL-FGVM02-nic4-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Prod-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Int_Dev-lbbpa1" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic7.id
ip_configuration_name = "LzPcFWL-FGVM01-nic7-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Dev-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-Int_Dev-lbbpa2" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic7.id
ip_configuration_name = "LzPcFWL-FGVM02-nic7-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Dev-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-MRZ-lbbpa1" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM01-nic5.id
ip_configuration_name = "LzPcFWL-FGVM01-nic5-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-MRZ-lbbp.id


}

resource "azurerm_network_interface_backend_address_pool_association" "LzPcFWL-FGVM-MRZ-lbbpa2" {

network_interface_id = azurerm_network_interface.LzPcFWL-FGVM02-nic5.id
ip_configuration_name = "LzPcFWL-FGVM02-nic5-config"
provider = azurerm.LzPc-PBMMCore
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-MRZ-lbbp.id


}

resource "azurerm_lb_probe" "LzPcFWL-FGVM-lbhp" {

name = "LzPcFWL-FGVM-lbhp"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "tcp"
port = 8008
interval_in_seconds = 5
number_of_probes = 2


}

resource "azurerm_lb_rule" "LzPcFWL-FGVM-Transit_Prod-lbr" {

name = "LzPcFWL-FGVM-Transit_Prod-lbr"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcFWL-FGVM-Transit_Prod-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Prod-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcFWL-FGVM-lbhp.id
depends_on = [azurerm_lb_probe.LzPcFWL-FGVM-lbhp]
disable_outbound_snat = "true"
}

resource "azurerm_lb_rule" "LzPcFWL-FGVM-Transit_Dev-lbr" {

name = "LzPcFWL-FGVM-Transit_Dev-lbr"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcFWL-FGVM-Transit_Dev-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Transit_Dev-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcFWL-FGVM-lbhp.id
depends_on = [azurerm_lb_probe.LzPcFWL-FGVM-lbhp]
disable_outbound_snat = "true"
}

resource "azurerm_lb_rule" "LzPcFWL-FGVM-Int_Prod-lbr" {

name = "LzPcFWL-FGVM-Int_Prod-lbr"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcFWL-FGVM-Core-Int_Prod-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Prod-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcFWL-FGVM-lbhp.id
depends_on = [azurerm_lb_probe.LzPcFWL-FGVM-lbhp]
disable_outbound_snat = "true"
}

resource "azurerm_lb_rule" "LzPcFWL-FGVM-Int_Dev-lbr" {

name = "LzPcFWL-FGVM-Int_Dev-lbr"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcFWL-FGVM-Core-Int_Dev-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-Int_Dev-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcFWL-FGVM-lbhp.id
depends_on = [azurerm_lb_probe.LzPcFWL-FGVM-lbhp]
disable_outbound_snat = "true"
}

resource "azurerm_lb_rule" "LzPcFWL-FGVM-MRZ-lbr" {

name = "LzPcFWL-FGVM-MRZ-lbr"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
loadbalancer_id = azurerm_lb.LzPcFWL-FGVM-lb.id
protocol = "All"
frontend_port = 0
backend_port = 0
frontend_ip_configuration_name = "LzPcFWL-FGVM-Core-MRZ-lbfe"
enable_floating_ip = false
backend_address_pool_id = azurerm_lb_backend_address_pool.LzPcFWL-FGVM-MRZ-lbbp.id
idle_timeout_in_minutes = 5
probe_id = azurerm_lb_probe.LzPcFWL-FGVM-lbhp.id
depends_on = [azurerm_lb_probe.LzPcFWL-FGVM-lbhp]
disable_outbound_snat = "true"
}

