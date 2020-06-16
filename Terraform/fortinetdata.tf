data "template_file" "fg1_custom_data" {
template = "${file("${path.module}/FG/customdata.tpl")}"
vars = {
fgt_vm_name = "LzPcFWL-FGVM01"
fgt_license_file = "${path.module}/FG/FGVM08TM20004487.lic"
fgt_ha_peerip = azurerm_network_interface.LzPcFWL-FGVM02-nic2.ip_configuration[0].private_ip_address
vnet_network = "azurerm_virtual_network.LzPcCNR-Core-vnet.address_space[0]"
fgt_vdom_prod_vdomlink0_ipaddr = "172.16.15.11"
fgt_vdom_prod_vdomlink0_mask = "255.255.255.128"
fgt_vdom_dev_vdomlink1_ipaddr = "172.16.15.12"
fgt_vdom_dev_vdomlink1_mask = "255.255.255.128"
fgt_vnet_network_prod = "172.16.64.0"
fgt_vnet_mask_prod = "255.255.240.0"
fgt_vnet_network_mrz = "172.16.32.0"
fgt_vnet_mask_mrz = "255.255.240.0"
fgt_vnet_network_dev = "172.17.64.0"
fgt_vnet_mask_dev = "255.255.240.0"
fgt_vnet_name_prod = "LzPcCNR-Prod-vnet"
fgt_vnet_name_mrz = "LzPcCNR-MRZ-vnet"
fgt_vnet_name_dev = "LzDcCNR-Dev-vnet"
# new block for paz routing
fgt_vnet_name_prod_paz = "LzDcCNR-Prod_PAZ-vnet"
fgt_vnet_network_prod_paz = "172.16.224.0"
fgt_vnet_mask_prod_paz = "255.255.240.0"
fgt_vnet_name_dev_paz = "LzDcCNR-Dev_PAZ-vnet"
fgt_vnet_network_dev_paz = "172.17.224.0"
fgt_vnet_mask_dev_paz = "255.255.240.0"
fgt_snet_name_core_ext = "LzDcCNR-Core-Ext-snet"
fgt_snet_network_core_ext = "172.16.0.0"
fgt_snet_mask_core_ext = "255.255.255.0"
#
fgt_vdom_prod_external_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic1.ip_configuration[0].private_ip_address
fgt_vdom_prod_external_mask = "${element(split("/" , azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix), 1)}"
fgt_vdom_prod_external_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)
# add variable for Inet outbound F5Int-lbfe
fgt_vdom_prod_external_F5Int-lbfe = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 10)
fgt_vdom_prod_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic4.ip_configuration[0].private_ip_address
fgt_vdom_prod_internal_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.address_prefix), 1)}"
fgt_vdom_prod_internal_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.address_prefix, 1)
fgt_vdom_dev_external_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic6.ip_configuration[0].private_ip_address
fgt_vdom_dev_external_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix), 1)}"
fgt_vdom_dev_external_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)
fgt_vdom_dev_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic7.ip_configuration[0].private_ip_address
fgt_vdom_dev_internal_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.address_prefix), 1)}"
fgt_vdom_dev_internal_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.address_prefix, 1)
fgt_hasync_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic2.ip_configuration[0].private_ip_address
fgt_hasync_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-HA-snet.address_prefix), 1)}"
fgt_hasync_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-HA-snet.address_prefix, 1)
fgt_vdom_prod_mrz_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic5.ip_configuration[0].private_ip_address
fgt_vdom_prod_mrz_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-MRZ-snet.address_prefix), 1)}"
fgt_vdom_prod_mrz_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-MRZ-snet.address_prefix, 1)
fgt_mgmt_ipaddr = azurerm_network_interface.LzPcFWL-FGVM01-nic3.ip_configuration[0].private_ip_address
fgt_mgmt_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-MGMT-snet.address_prefix), 1)})"
fgt_mgmt_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-MGMT-snet.address_prefix, 1)
}
}


data "template_file" "fg2_custom_data" {
template = "${file("${path.module}/FG/customdata.tpl")}"
vars = {
fgt_vm_name = "LzPcFWL-FGVM02"
fgt_license_file = "${path.module}/FG/FGVM08TM20004488.lic"
fgt_ha_peerip = azurerm_network_interface.LzPcFWL-FGVM01-nic2.ip_configuration[0].private_ip_address
vnet_network = "azurerm_virtual_network.LzPcCNR-Core-vnet.address_space[0]"
fgt_vdom_prod_vdomlink0_ipaddr = "172.16.15.11"
fgt_vdom_prod_vdomlink0_mask = "255.255.255.128"
fgt_vdom_dev_vdomlink1_ipaddr = "172.16.15.12"
fgt_vdom_dev_vdomlink1_mask = "255.255.255.128"
fgt_vnet_network_prod = "172.16.64.0"
fgt_vnet_mask_prod = "255.255.240.0"
fgt_vnet_network_mrz = "172.16.32.0"
fgt_vnet_mask_mrz = "255.255.240.0"
fgt_vnet_network_dev = "172.17.64.0"
fgt_vnet_mask_dev = "255.255.240.0"
fgt_vnet_name_prod = "LzPcCNR-Prod-vnet"
fgt_vnet_name_mrz = "LzPcCNR-MRZ-vnet"
fgt_vnet_name_dev = "LzDcCNR-Dev-vnet"
# new block for paz routing
fgt_vnet_name_prod_paz = "LzDcCNR-Prod_PAZ-vnet"
fgt_vnet_network_prod_paz = "172.16.224.0"
fgt_vnet_mask_prod_paz = "255.255.240.0"
fgt_vnet_name_dev_paz = "LzDcCNR-Dev_PAZ-vnet"
fgt_vnet_network_dev_paz = "172.17.224.0"
fgt_vnet_mask_dev_paz = "255.255.240.0"
fgt_snet_name_core_ext = "LzDcCNR-Core-Ext-snet"
fgt_snet_network_core_ext = "172.16.0.0"
fgt_snet_mask_core_ext = "255.255.255.0"
#
fgt_vdom_prod_external_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic1.ip_configuration[0].private_ip_address
fgt_vdom_prod_external_mask = "${element(split("/" , azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix), 1)}"
fgt_vdom_prod_external_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)
# add variable for Inet outbound F5Int-lbfe
fgt_vdom_prod_external_F5Int-lbfe = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 10)
fgt_vdom_prod_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic4.ip_configuration[0].private_ip_address
fgt_vdom_prod_internal_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.address_prefix), 1)}"
fgt_vdom_prod_internal_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.address_prefix, 1)
fgt_vdom_dev_external_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic6.ip_configuration[0].private_ip_address
fgt_vdom_dev_external_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix), 1)}"
fgt_vdom_dev_external_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Transit-snet.address_prefix, 1)
fgt_vdom_dev_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic7.ip_configuration[0].private_ip_address
fgt_vdom_dev_internal_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.address_prefix), 1)}"
fgt_vdom_dev_internal_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.address_prefix, 1)
fgt_hasync_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic2.ip_configuration[0].private_ip_address
fgt_hasync_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-HA-snet.address_prefix), 1)}"
fgt_hasync_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-HA-snet.address_prefix, 1)
fgt_vdom_prod_mrz_internal_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic5.ip_configuration[0].private_ip_address
fgt_vdom_prod_mrz_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-MRZ-snet.address_prefix), 1)}"
fgt_vdom_prod_mrz_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-MRZ-snet.address_prefix, 1)
fgt_mgmt_ipaddr = azurerm_network_interface.LzPcFWL-FGVM02-nic3.ip_configuration[0].private_ip_address
fgt_mgmt_mask = "${element(split("/", azurerm_subnet.LzPcCNR-Core-MGMT-snet.address_prefix), 1)}"
fgt_mgmt_gw = cidrhost(azurerm_subnet.LzPcCNR-Core-MGMT-snet.address_prefix, 1)
}
}


