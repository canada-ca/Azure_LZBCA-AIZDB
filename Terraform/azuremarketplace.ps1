# Please run these commands to modify core subscription to accept azure marketplace licenses for fortinet firewall and F5
# You will be prompted to login first via powershell to reach the tenant; please run this on a deployment host with unblocked ports [not ssc laptop]

Connect-AzAccount
Set-AzContext -SubscriptionId "ENTER CORE SUBSCRIPTION GUID"
Get-AzMarketplaceTerms -Publisher fortinet -Product fortinet_fortigate-vm_v5 -Name fortinet_fg-vm | Set-AzMarketplaceTerms -Accept
Set-AzContext -SubscriptionId "ENTER CORE SUBSCRIPTION GUID"
Get-AzMarketplaceTerms -Publisher f5-networks -Product f5-big-ip-byol -Name f5-big-all-2slot-byol | Set-AzMarketplaceTerms -Accept

