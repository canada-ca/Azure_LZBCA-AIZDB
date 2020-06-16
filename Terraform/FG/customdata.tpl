Content-Type: multipart/mixed; boundary="===============0086047718136476635=="
MIME-Version: 1.0

--===============0086047718136476635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="config"

config system global
    set admintimeout 120
    set hostname "${fgt_vm_name}"
    set timezone 12
    set gui-theme mariner
end
config vpn ssl settings
    set port 7443
end
config system probe-response
    set http-probe-value OK
    set mode http-probe
end
config system global
    set vdom-mode multi-vdom
end
config vdom
    edit root
        config system settings
            set allow-subnet-overlap enable
            set gui-dos-policy disable
            set gui-dynamic-routing disable
            set gui-threat-weight disable
            set gui-endpoint-control disable
            set gui-wireless-controller disabl
            set gui-traffic-shaping disable
            set gui-wan-load-balancing disable
        end
    next
    edit PROD
        config system settings
            set allow-subnet-overlap enable
            set gui-dos-policy disable
            set gui-dynamic-routing disable
            set gui-threat-weight disable
            set gui-endpoint-control disable
            set gui-wireless-controller disabl
            set gui-traffic-shaping disable
            set gui-wan-load-balancing disable            
        end
    next
    edit DEV
        config system settings
            set gui-dos-policy disable
            set gui-dynamic-routing disable
            set gui-threat-weight disable
            set gui-endpoint-control disable
            set gui-wireless-controller disabl
            set gui-traffic-shaping disable
            set gui-wan-load-balancing disable        
            set allow-subnet-overlap enable
        end
    next
end
config global
    config system global
        set management-vdom PROD
    end
    config system ha
        set group-name AzureHA
        set mode a-p
        set hbdev port2 100
        set session-pickup enable
        set session-pickup-connectionless enable
        set ha-mgmt-status enable
        config ha-mgmt-interfaces
            edit 1
                set interface port3
                set gateway ${fgt_mgmt_gw}
            next
        end
        set override disable
        set priority 1
        set unicast-hb enable
        set unicast-hb-peerip ${fgt_ha_peerip}
    end
end   
config global
    config system dns
       set primary 208.91.112.52
       set secondary 208.91.112.53
    end
    config system vdom-link
        edit "vdomlink"
        next
    end
    config system interface
        edit port1
            set vdom PROD        
            set mode static
            set ip ${fgt_vdom_prod_external_ipaddr}/${fgt_vdom_prod_external_mask}
            set description external
            set allowaccess probe-response
        next
        edit port2
            set mode static
            set ip ${fgt_hasync_ipaddr}/${fgt_hasync_mask}
            set description hasync
        next
        edit port3
             set mode static
            set ip ${fgt_mgmt_ipaddr}/${fgt_mgmt_mask}
            set description mgmt
            set allowaccess ping https ssh ftm
        next         
        edit port4
            set vdom PROD        
            set mode static
            set ip ${fgt_vdom_prod_internal_ipaddr}/${fgt_vdom_prod_internal_mask}
            set description internal
            set allowaccess probe-response        
        next
        edit port5
            set vdom PROD        
            set mode static
            set ip ${fgt_vdom_prod_mrz_internal_ipaddr}/${fgt_vdom_prod_mrz_mask}
            set description MRZ_internal
            set allowaccess probe-response        
        next        
        edit port6
            set vdom DEV        
            set mode static
            set ip ${fgt_vdom_dev_external_ipaddr}/${fgt_vdom_dev_external_mask}
            set description external
            set allowaccess probe-response
        next
        edit port7
            set vdom DEV        
            set mode static
            set ip ${fgt_vdom_dev_internal_ipaddr}/${fgt_vdom_dev_internal_mask}
            set description internal
            set allowaccess probe-response        
        next
        edit "vdomlink0"
            set vdom "PROD"
            set ip ${fgt_vdom_prod_vdomlink0_ipaddr}/${fgt_vdom_prod_vdomlink0_mask}
            set allowaccess ping
            set type vdom-link
            set snmp-index 11
        next
        edit "vdomlink1"
            set vdom "DEV"
            set ip ${fgt_vdom_dev_vdomlink1_ipaddr}/${fgt_vdom_dev_vdomlink1_mask}
            set allowaccess ping
            set type vdom-link
            set snmp-index 12
        next        
    end
end
config vdom
    edit PROD
        config router static
            edit 1
                set gateway ${fgt_vdom_prod_external_gw}
                set device port1
            next
            edit 2
                set dst 168.63.129.16 255.255.255.255
                set gateway ${fgt_vdom_prod_external_gw}
                set device port1       
            next
            edit 3
                set dst 168.63.129.16 255.255.255.255
                set gateway ${fgt_vdom_prod_internal_gw}
                set device port4        
            next
            edit 4
                set dst 168.63.129.16 255.255.255.255
                set gateway ${fgt_vdom_prod_mrz_gw}
                set device port5        
            next            
            edit 5
                set dst ${fgt_vnet_network_prod} ${fgt_vnet_mask_prod}
                set gateway ${fgt_vdom_prod_internal_gw}
                set device port4
            next
            edit 6
                set dst ${fgt_vnet_network_mrz} ${fgt_vnet_mask_mrz}
                set gateway ${fgt_vdom_prod_mrz_gw}
                set device port5
            next
            edit 7
                set dst ${fgt_vnet_network_dev} ${fgt_vnet_mask_dev}
                set gateway ${fgt_vdom_dev_vdomlink1_ipaddr}
                set device vdomlink0
            next
            edit 8
                set dst ${fgt_vnet_network_prod_paz} ${fgt_vnet_mask_prod_paz}
                set gateway ${fgt_vdom_prod_external_gw}
                set device port1
            next
            edit 9
                set dst ${fgt_vnet_network_dev_paz} ${fgt_vnet_mask_dev_paz}
                set gateway ${fgt_vdom_dev_vdomlink1_ipaddr}
                set device vdomlink0
            next
            edit 10
                set dst ${fgt_snet_network_core_ext} ${fgt_snet_mask_core_ext}
                set gateway ${fgt_vdom_prod_external_F5Int-lbfe}
                set device port1
            next
        end
        config firewall address
            edit "${fgt_vnet_name_dev}"
                set subnet ${fgt_vnet_network_dev} ${fgt_vnet_mask_dev}
            next
            edit "${fgt_vnet_name_mrz}"
                set subnet ${fgt_vnet_network_mrz} ${fgt_vnet_mask_mrz}
            next
            edit "${fgt_vnet_name_prod}"
                set subnet ${fgt_vnet_network_prod} ${fgt_vnet_mask_prod}
            next
        end
        config firewall policy
            edit 1
                set name "PROD to DEV"
                set srcintf "port4"
                set dstintf "vdomlink0"
                set srcaddr "${fgt_vnet_name_prod}"
                set dstaddr "${fgt_vnet_name_dev}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next
            edit 2
                set name "MRZ to DEV"
                set srcintf "port5"
                set dstintf "vdomlink0"
                set srcaddr "${fgt_vnet_name_mrz}"
                set dstaddr "${fgt_vnet_name_dev}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next
            edit 3
                set name "DEV to PROD"
                set srcintf "vdomlink0"
                set dstintf "port4"
                set srcaddr "${fgt_vnet_name_dev}"
                set dstaddr "${fgt_vnet_name_prod}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next    
            edit 4
                set name "MRZ to PROD"
                set srcintf "vdomlink0"
                set dstintf "port4"
                set srcaddr "${fgt_vnet_name_mrz}"
                set dstaddr "${fgt_vnet_name_prod}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next    
        end         
    next        
    edit DEV
        config router static
            edit 1
                set gateway ${fgt_vdom_prod_external_F5Int-lbfe}
                set device port6
            next
             edit 2
                set dst 168.63.129.16 255.255.255.255
                set gateway ${fgt_vdom_dev_external_gw}
                set device port6        
            next
            edit 3
                set dst 168.63.129.16 255.255.255.255
                set gateway ${fgt_vdom_dev_internal_gw}
                set device port7      
            next
            edit 4
                set dst ${fgt_vnet_network_dev} ${fgt_vnet_mask_dev}
                set gateway ${fgt_vdom_dev_internal_gw}
                set device port7
            next
            edit 5
                set dst ${fgt_vnet_network_prod} ${fgt_vnet_mask_prod}
                set gateway ${fgt_vdom_prod_vdomlink0_ipaddr}
                set device vdomlink1
            next
            edit 6
                set dst ${fgt_vnet_network_mrz} ${fgt_vnet_mask_mrz}
                set gateway ${fgt_vdom_prod_vdomlink0_ipaddr}
                set device vdomlink1
            next
            edit 7
                set dst ${fgt_vnet_network_dev_paz} ${fgt_vnet_mask_dev_paz}
                set gateway ${fgt_vdom_prod_external_gw}
                set device port6
            next
            edit 8
                set dst ${fgt_vnet_network_prod_paz} ${fgt_vnet_mask_prod_paz}
                set gateway ${fgt_vdom_prod_vdomlink0_ipaddr}
                set device vdomlink1
            next
            edit 9
                set dst ${fgt_snet_network_core_ext} ${fgt_snet_mask_core_ext}
                set gateway ${fgt_vdom_prod_external_F5Int-lbfe}
                set device port6
            next
        end
        config firewall address
            edit "${fgt_vnet_name_dev}"
                set subnet ${fgt_vnet_network_dev} ${fgt_vnet_mask_dev}
            next
            edit "${fgt_vnet_name_mrz}"
                set subnet ${fgt_vnet_network_mrz} ${fgt_vnet_mask_mrz}
            next
            edit "${fgt_vnet_name_prod}"
                set subnet ${fgt_vnet_network_prod} ${fgt_vnet_mask_prod}
            next
        end
        config firewall policy
            edit 1
                set name "DEV to PROD"
                set srcintf "port7"
                set dstintf "vdomlink1"
                set srcaddr "${fgt_vnet_name_dev}"
                set dstaddr "${fgt_vnet_name_prod}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next
            edit 2
                set name "DEV to MRZ"
                set srcintf "port7"
                set dstintf "vdomlink1"
                set srcaddr "${fgt_vnet_name_dev}"
                set dstaddr "${fgt_vnet_name_mrz}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next
            edit 3
                set name "PROD to DEV"
                set srcintf "vdomlink1"
                set dstintf "port7"
                set srcaddr "${fgt_vnet_name_prod}"
                set dstaddr "${fgt_vnet_name_dev}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next    
            edit 4
                set name "MRZ to DEV"
                set srcintf "vdomlink1"
                set dstintf "port7"
                set srcaddr "${fgt_vnet_name_mrz}"
                set dstaddr "${fgt_vnet_name_dev}"
                set action accept
                set schedule "always"
                set service "ALL"
                set logtraffic all
            next
        end     
    next        
end





%{ if fgt_license_file != "" }
--===============0086047718136476635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="${fgt_license_file}"

${file(fgt_license_file)}

%{ endif }
--===============0086047718136476635==--