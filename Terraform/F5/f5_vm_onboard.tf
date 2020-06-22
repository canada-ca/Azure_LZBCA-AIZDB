# Setup Onboarding script
data "template_file" "LzPcADC-F5VM-vm_onboard" {
    template = "${file("${path.module}/templates/f5_vm_onboard.tmpl.sh")}"
    vars = {
        onboard_log		      = "/var/log/startup-script.log"
        doVersion             = "latest"
        as3Version            = "latest"
        tsVersion             = "latest"
        cfVersion             = "latest"
        fastVersion           = "latest"
        
        doExternalDeclarationUrl = "https://example.domain.com/do.json"
        as3ExternalDeclarationUrl = "https://example.domain.com/as3.json"
        tsExternalDeclarationUrl = "https://example.domain.com/ts.json"
        cfExternalDeclarationUrl = "https://example.domain.com/cf.json"
        fastExternalDeclarationUrl = "https://example.domain.com/fast.json"
        
        DO1_Document        = "${data.template_file.LzPcADC-F5VM01-do_json.rendered}"
        DO2_Document        = "${data.template_file.LzPcADC-F5VM02-do_json.rendered}"
        AS3_Document        = "${data.template_file.LzPcADC-F5VM01-as3_ts_json.rendered}"
        TS_Document         = "${data.template_file.LzPcADC-F5VM01-ts_json.rendered}"

        api_user       = "azops"
        api_pass       = "Canada1!"
        mgmt_ip1       = "172.16.5.11"
        mgmt_ip2       = "172.16.5.12"
        mgmt_gw        = "172.16.5.1"
        mgmt_dns       = "168.63.129.16"
        dns_domain     = "azure.local"

        webssh_vip     = "${cidrhost(data.azurerm_subnet.LzPcCNR-Core-External-snet.address_prefix, 10)}"
        f5vm01_mgmt_ip = azurerm_network_interface.LzPcADC-F5VM01-nic1.private_ip_addresses[0]
        f5vm02_mgmt_ip = azurerm_network_interface.LzPcADC-F5VM02-nic1.private_ip_addresses[0]
    }
}
