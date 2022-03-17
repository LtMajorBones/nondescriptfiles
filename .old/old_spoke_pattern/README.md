# TERRAFORM COMMANDS
# Working Directory

# TERRAFORM INIT
terraform init
terraform init -upgrade

# TERRAFORM PLAN
terraform plan -out="../../VAR_FILES/SPOKES/SPOKE000/securespoke.plan" -var-file="../../VAR_FILES/SPOKES/SPOKE000/spoke.tfvars"

# TERRAFORM APPLY
terraform apply "../../VAR_FILES/SPOKES/SPOKE000/securespoke.plan"



# Import Examples
terraform import -var-file="../../VAR_FILES/SPOKES/SPOKE000/spoke.tfvars" module.provision_spoke.module.virtual_networks[\"VirtualNetworkDevelopment\"].azurerm_virtual_network.vnet "/subscriptions/2a37ba52-e650-4242-b7a5-e19ae423716b/resourceGroups/rg-cvsntwkspk0000dev000/providers/Microsoft.Network/virtualNetworks/vnet-cvscorespk0000dev000"

terraform import -var-file="../../VAR_FILES/SPOKES/SPOKE000/spoke.tfvars" module.provision_spoke.module.virtual_networks[\"VirtualNetworkDisasterRecovery\"].azurerm_virtual_network.vnet "/subscriptions/2a37ba52-e650-4242-b7a5-e19ae423716b/resourceGroups/rg-cvsntwkspk0000dr000/providers/Microsoft.Network/virtualNetworks/vnet-cvscorespk0000dr000"

terraform import -var-file="../../VAR_FILES/SPOKES/SPOKE000/spoke.tfvars" module.provision_spoke.module.virtual_networks[\"VirtualNetworkProd\"].azurerm_virtual_network.vnet "/subscriptions/2a37ba52-e650-4242-b7a5-e19ae423716b/resourceGroups/rg-cvsntwkspk0000prod000/providers/Microsoft.Network/virtualNetworks/vnet-cvscorespk0000prod000"

terraform import -var-file="../../VAR_FILES/SPOKES/SPOKE000/spoke.tfvars" module.provision_spoke.module.virtual_networks[\"VirtualNetworkQualityAssurance\"].azurerm_virtual_network.vnet "/subscriptions/2a37ba52-e650-4242-b7a5-e19ae423716b/resourceGroups/rg-cvsntwkspk0000qa000/providers/Microsoft.Network/virtualNetworks/vnet-cvscorespk0000qa000"

# REMOVE

terraform state rm module.provision_spoke.module.virtual_networks[\"VirtualNetworkDevelopment\"].azurerm_virtual_network.network_vnet

terraform state rm module.provision_spoke.module.virtual_networks[\"VirtualNetworkDisasterRecovery\"].azurerm_virtual_network.network_vnet

terraform state rm module.provision_spoke.module.virtual_networks[\"VirtualNetworkProd\"].azurerm_virtual_network.network_vnet

terraform state rm module.provision_spoke.module.virtual_networks[\"VirtualNetworkQualityAssurance\"].azurerm_virtual_network.network_vnet
