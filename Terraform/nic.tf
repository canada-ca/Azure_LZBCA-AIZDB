resource "azurerm_network_interface" "LzPcSWA-ADDS01-nic1" {

name = "LzPcSWA-ADDS01-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcSWA-ADDS01-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-MRZ-INF-snet.id
private_ip_address = "172.16.33.10"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcSWA-ADDS02-nic1" {

name = "LzPcSWA-ADDS02-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcSWA-ADDS02-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-MRZ-INF-snet.id
private_ip_address = "172.16.33.11"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcSWJ-RDSH01-nic1" {

name = "LzPcSWJ-RDSH01-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcSWJ-RDSH01-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-MRZ-MAZ-snet.id
private_ip_address = "172.16.32.10"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcSWJ-RDSH02-nic1" {

name = "LzPcSWJ-RDSH02-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcSWJ-RDSH02-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-MRZ-MAZ-snet.id
private_ip_address = "172.16.32.11"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic1" {

name = "LzPcFWL-FGVM01-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.21"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic2" {

name = "LzPcFWL-FGVM01-nic2"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic2-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-HA-snet.id
private_ip_address = "172.16.15.141"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic3" {

name = "LzPcFWL-FGVM01-nic3"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic3-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-MGMT-snet.id
private_ip_address = "172.16.5.21"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic4" {

name = "LzPcFWL-FGVM01-nic4"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic4-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.id
private_ip_address = "172.16.2.11"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic5" {

name = "LzPcFWL-FGVM01-nic5"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic5-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-MRZ-snet.id
private_ip_address = "172.16.4.11"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic6" {

name = "LzPcFWL-FGVM01-nic6"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic6-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.31"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM01-nic7" {

name = "LzPcFWL-FGVM01-nic7"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM01-nic7-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.id
private_ip_address = "172.16.3.11"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic1" {

name = "LzPcFWL-FGVM02-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.22"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic2" {

name = "LzPcFWL-FGVM02-nic2"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic2-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-HA-snet.id
private_ip_address = "172.16.15.142"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic3" {

name = "LzPcFWL-FGVM02-nic3"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic3-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-MGMT-snet.id
private_ip_address = "172.16.5.22"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic4" {

name = "LzPcFWL-FGVM02-nic4"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic4-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Prod-snet.id
private_ip_address = "172.16.2.12"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic5" {

name = "LzPcFWL-FGVM02-nic5"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic5-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-MRZ-snet.id
private_ip_address = "172.16.4.12"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic6" {

name = "LzPcFWL-FGVM02-nic6"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic6-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Transit-snet.id
private_ip_address = "172.16.1.32"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcFWL-FGVM02-nic7" {

name = "LzPcFWL-FGVM02-nic7"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-Security_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "true"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcFWL-FGVM02-nic7-config"
subnet_id = azurerm_subnet.LzPcCNR-Core-Int_Dev-snet.id
private_ip_address = "172.16.3.12"
private_ip_address_allocation = "static"
primary = "true"
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

resource "azurerm_network_interface" "LzPcSWE-MGMT01-nic1" {

name = "LzPcSWE-MGMT01-nic1"
location = "canadaCentral"
resource_group_name = azurerm_resource_group.LzPc-System_Core-rg.name
provider = azurerm.LzPc-PBMMCore
enable_ip_forwarding = "false"
enable_accelerated_networking = "false"


ip_configuration {
name = "LzPcSWE-MGMT01-nic1-config"
subnet_id = azurerm_subnet.LzPcCNR-MRZ-MGMT-snet.id
private_ip_address = "172.16.36.10"
private_ip_address_allocation = "static"
primary = "true"
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
