# VM01 DO Declaration from template
data "template_file" "LzPcADC-F5VM01-do_json" {
template = "${file("${path.module}/templates/f5_do.tmpl.json")}"
vars = {
regkey         = "KBRMS-OXORL-OBWCS-EEUWF-IEMAAZR"
host1          = "LzPcADC-F5VM01"
host2          = "LzPcADC-F5VM02"
domainname     = "azure.local"
local_host     = "LzPcADC-F5VM01"
local_selfip1  = azurerm_network_interface.LzPcADC-F5VM01-nic2.private_ip_addresses[0]
local_selfip2  = azurerm_network_interface.LzPcADC-F5VM01-nic3.private_ip_addresses[0]
remote_selfip  = azurerm_network_interface.LzPcADC-F5VM01-nic1.private_ip_addresses[0]
dns_server1    = "8.8.8.8"
dns_server2    = "168.63.129.16"
ntp_server     = "ntp.cira.ca"
gateway        = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-External-snet.address_prefix, 1)}" //"172.16.0.1"
int_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)}"  //"172.16.1.1"
##### June 14 modifications
#int_cidr       = "10.24.0.0/16"
#paz_cidr       = "192.168.0.0/16"
#sandbox_cidr   = "172.16.0.0/16"
int_p_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 20)}" //"172.16.1.20"
int_d_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 30)}" //"172.16.1.30"
int_p_cidr     = "172.16.64.0/20"
int_d_cidr     = "172.17.64.0/20"
int_m_cidr     = "172.16.32.0/20"
paz_p_cidr     = "172.16.224.0/20"
paz_d_cidr     = "172.17.224.0/20"
#####
timezone       = "UTC"
banner_color   = "blue"
admin_user     = "azops"
admin_pass     = "Canada12345"
}
}

# VM02 DO Declaration from template
data "template_file" "LzPcADC-F5VM02-do_json" {
template = "${file("${path.module}/templates/f5_do.tmpl.json")}"
vars = {
regkey         = "AFCGK-RHFZM-UJQIR-DJSKE-QFRAEFB"
host1          = "LzPcADC-F5VM01"
host2          = "LzPcADC-F5VM02"
domainname     = "azure.local"
local_host     = "LzPcADC-F5VM02"
local_selfip1  = azurerm_network_interface.LzPcADC-F5VM02-nic2.private_ip_addresses[0]
local_selfip2  = azurerm_network_interface.LzPcADC-F5VM02-nic3.private_ip_addresses[0]
remote_selfip  = azurerm_network_interface.LzPcADC-F5VM01-nic1.private_ip_addresses[0]
dns_server1    = "8.8.8.8"
dns_server2    = "168.63.129.16"
ntp_server     = "ntp.cira.ca"
gateway        = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-External-snet.address_prefix, 1)}" //"172.16.0.1"
int_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)}"  //"172.16.1.1"
##### June 14 modifications
#int_cidr       = "10.24.0.0/16"
#paz_cidr       = "192.168.0.0/16"
#sandbox_cidr   = "172.16.0.0/16"
int_p_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 20)}" //"172.16.1.20"
int_d_gateway    = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 30)}" //"172.16.1.30"
int_p_cidr     = "172.16.64.0/20"
int_d_cidr     = "172.17.64.0/20"
int_m_cidr     = "172.16.32.0/20"
paz_p_cidr     = "172.16.224.0/20"
paz_d_cidr     = "172.17.224.0/20"
#####
timezone       = "UTC"
banner_color   = "blue"
admin_user     = "azops"
admin_pass     = "Canada12345"
}
}

# TS Declaration from template
data "template_file" "LzPcADC-F5VM01-ts_json" {
template = "${file("${path.module}/templates/f5_ts.tmpl.json")}"
depends_on = [data.azurerm_log_analytics_workspace.LzPcCLD-CoreSecurity-law]
vars = {
law_id = "${data.azurerm_log_analytics_workspace.LzPcCLD-CoreSecurity-law.workspace_id}"
law_primkey = "${data.azurerm_log_analytics_workspace.LzPcCLD-CoreSecurity-law.primary_shared_key}"
location = "canadaCentral"
}
}

# AS3 TS Declaration from template
data "template_file" "LzPcADC-F5VM01-as3_ts_json" {
template = "${file("${path.module}/templates/f5_as3_ts.tmpl.json")}"
vars = {
webssh_vs_addr = data.azurerm_subnet.LzPcCNR-Core-External-snet.address_prefix
}
}
