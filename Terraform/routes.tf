resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev_PAZ-rt-LzDcCNR-Dev_PAZ-App-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev_PAZ-App-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev_PAZ-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev_PAZ-rt-LzDcCNR-Dev_PAZ-FE-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev_PAZ-FE-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev_PAZ-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev-rt-LzDcCNR-Dev-App-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev-App-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev-rt-LzDcCNR-Dev-Data-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev-Data-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev-rt-LzDcCNR-Dev-FE-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev-FE-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzDcCNR-Dev-rt-LzDcCNR-Dev-Pres-snet" {

subnet_id = azurerm_subnet.LzDcCNR-Dev-Pres-snet.id
route_table_id = azurerm_route_table.LzDcCNR-Dev-rt.id
provider = azurerm.LzDc-PBMMDevelopment
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Core-Transit-rt-LzPcCNR-Core-Transit-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Core-Transit-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-MRZ-rt-LzPcCNR-MRZ-INF-snet" {

subnet_id = azurerm_subnet.LzPcCNR-MRZ-INF-snet.id
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-MRZ-rt-LzPcCNR-MRZ-LOG-snet" {

subnet_id = azurerm_subnet.LzPcCNR-MRZ-LOG-snet.id
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-MRZ-rt-LzPcCNR-MRZ-MAZ-snet" {

subnet_id = azurerm_subnet.LzPcCNR-MRZ-MAZ-snet.id
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-MRZ-rt-LzPcCNR-MRZ-SEC-snet" {

subnet_id = azurerm_subnet.LzPcCNR-MRZ-SEC-snet.id
route_table_id = azurerm_route_table.LzPcCNR-MRZ-rt.id
provider = azurerm.LzPc-PBMMCore
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod_PAZ-rt-LzPcCNR-Prod_PAZ-App-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod_PAZ-App-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod_PAZ-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod_PAZ-rt-LzPcCNR-Prod_PAZ-FE-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod_PAZ-FE-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod_PAZ-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod-rt-LzPcCNR-Prod-App-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod-App-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod-rt-LzPcCNR-Prod-Data-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod-Data-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod-rt-LzPcCNR-Prod-FE-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod-FE-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_subnet_route_table_association" "LzPcCNR-Prod-rt-LzPcCNR-Prod-Pres-snet" {

subnet_id = azurerm_subnet.LzPcCNR-Prod-Pres-snet.id
route_table_id = azurerm_route_table.LzPcCNR-Prod-rt.id
provider = azurerm.LzPc-PBMMProduction
}

resource "azurerm_route_table" "LzDcCNR-Dev_PAZ-rt" {

name = "LzDcCNR-Dev_PAZ-rt"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
location = "Canada Central"
provider = azurerm.LzDc-PBMMDevelopment
disable_bgp_route_propagation = false

route {
name = "LzDcCNR-Dev_PAZ-rt-toCoreF5_Transit_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.1.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzDcCNR-Dev_PAZ-rt-toCoreFW_Transit_Dev-route"
address_prefix = "172.17.64.0/20"
next_hop_in_ip_address = "172.16.1.30"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzDcCNR-Dev_PAZ-rt-toCoreFW_Transit_Prod_PAZ-route"
address_prefix = "172.16.224.0/20"
next_hop_in_ip_address = "172.16.1.30"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzDcCNR-Dev_PAZ-rt-toCoreFW_Transit_Prod-route"
address_prefix = "172.16.64.0/20"
next_hop_in_ip_address = "172.16.1.30"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Dev_PAZ-rt-toCoreFW_Transit_MRZ-route"
address_prefix = "172.16.32.0/20"
next_hop_in_ip_address = "172.16.1.30"
next_hop_type = "VirtualAppliance"
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

resource "azurerm_route_table" "LzDcCNR-Dev-rt" {

name = "LzDcCNR-Dev-rt"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
location = "Canada Central"
provider = azurerm.LzDc-PBMMDevelopment
disable_bgp_route_propagation = false

route {
name = "LzDcCNR-Dev-rt-toCoreFW_Internal_Dev_Core-route"
address_prefix = "172.16.0.0/20"
next_hop_in_ip_address = "172.16.3.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzDcCNR-Dev-rt-toCoreFW_Internal_Dev_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.3.10"
next_hop_type = "VirtualAppliance"
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

resource "azurerm_route_table" "LzPcCNR-Core-Transit-rt" {

name = "LzPcCNR-Core-Transit-rt"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
location = "Canada Central"
provider = azurerm.LzPc-PBMMCore
disable_bgp_route_propagation = false

route {
name = "LzPcCNR-Core-Transit-rt-toCoreF5_Transit_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.1.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Core-Transit-rt-toCoreFW_Transit_Prod-route"
address_prefix = "172.16.64.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Core-Transit-rt-toCoreFW_Transit_Dev-route"
address_prefix = "172.17.64.0/20"
next_hop_in_ip_address = "172.16.1.30"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Core-Transit-rt-toCoreFW_Transit_MRZ-route"
address_prefix = "172.16.32.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
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

resource "azurerm_route_table" "LzPcCNR-MRZ-rt" {

name = "LzPcCNR-MRZ-rt"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
location = "Canada Central"
provider = azurerm.LzPc-PBMMCore
disable_bgp_route_propagation = false

route {
name = "LzPcCNR-MRZ-rt-toCoreFW_MRZ_Core-route"
address_prefix = "172.16.0.0/20"
next_hop_in_ip_address = "172.16.4.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-MRZ-rt-toCoreFW_MRZ_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.4.10"
next_hop_type = "VirtualAppliance"
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

resource "azurerm_route_table" "LzPcCNR-Prod_PAZ-rt" {

name = "LzPcCNR-Prod_PAZ-rt"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
location = "Canada Central"
provider = azurerm.LzPc-PBMMProduction
disable_bgp_route_propagation = false

route {
name = "LzPcCNR-Prod_PAZ-rt-toCoreF5_Transit_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.1.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Prod_PAZ-rt-toCoreFW_Transit_Prod-route"
address_prefix = "172.16.64.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Prod_PAZ-rt-toCoreFW_Transit_Dev_PAZ-route"
address_prefix = "172.17.224.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Prod_PAZ-rt-toCoreFW_Transit_Dev-route"
address_prefix = "172.17.64.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Prod_PAZ-rt-toCoreFW_Transit_MRZ-route"
address_prefix = "172.16.32.0/20"
next_hop_in_ip_address = "172.16.1.20"
next_hop_type = "VirtualAppliance"
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

resource "azurerm_route_table" "LzPcCNR-Prod-rt" {

name = "LzPcCNR-Prod-rt"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
location = "Canada Central"
provider = azurerm.LzPc-PBMMProduction
disable_bgp_route_propagation = false

route {
name = "LzPcCNR-Prod-rt-toCoreFW_Internal_Core-route"
address_prefix = "172.16.0.0/20"
next_hop_in_ip_address = "172.16.2.10"
next_hop_type = "VirtualAppliance"
}

route {
name = "LzPcCNR-Prod-rt-toCoreFW_Internal_Internet-route"
address_prefix = "0.0.0.0/0"
next_hop_in_ip_address = "172.16.2.10"
next_hop_type = "VirtualAppliance"
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

