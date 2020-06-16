resource "azurerm_network_security_group" "LzDcCNR-Dev_PAZ-App-nsg" {

name = "LzDcCNR-Dev_PAZ-App-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzDcCNR-Dev_PAZ-FE-nsg" {

name = "LzDcCNR-Dev_PAZ-FE-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzDcCNR-Dev-App-nsg" {

name = "LzDcCNR-Dev-App-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzDcCNR-Dev-Data-nsg" {

name = "LzDcCNR-Dev-Data-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzDcCNR-Dev-FE-nsg" {

name = "LzDcCNR-Dev-FE-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzDcCNR-Dev-Pres-nsg" {

name = "LzDcCNR-Dev-Pres-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzDc-Network_Dev-rg.name
provider = azurerm.LzDc-PBMMDevelopment

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-MRZ-INF-nsg" {

name = "LzPcCNR-MRZ-INF-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-MRZ-LOG-nsg" {

name = "LzPcCNR-MRZ-LOG-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-MRZ-MAZ-nsg" {

name = "LzPcCNR-MRZ-MAZ-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389"]
source_address_prefixes = ["172.16.1.0/24"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-MRZ-SEC-nsg" {

name = "LzPcCNR-MRZ-SEC-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Core-rg.name
provider = azurerm.LzPc-PBMMCore

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod_PAZ-App-nsg" {

name = "LzPcCNR-Prod_PAZ-App-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod_PAZ-FE-nsg" {

name = "LzPcCNR-Prod_PAZ-FE-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod-App-nsg" {

name = "LzPcCNR-Prod-App-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod-Data-nsg" {

name = "LzPcCNR-Prod-Data-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod-FE-nsg" {

name = "LzPcCNR-Prod-FE-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

resource "azurerm_network_security_group" "LzPcCNR-Prod-Pres-nsg" {

name = "LzPcCNR-Prod-Pres-nsg"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Network_Prod-rg.name
provider = azurerm.LzPc-PBMMProduction

security_rule {
name = "Allow_MAZ_RDPSessionHost"
priority = "100"
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = "*"
destination_port_ranges = ["3389","22"]
source_address_prefixes = ["172.16.32.10","172.16.32.11"]
destination_address_prefix = "*"
description = "Allow_MAZ_SessionHost"
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

