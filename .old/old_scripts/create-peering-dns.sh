####################################################################
#     USAGE: sh create-peering.sh <SUBSCRIPTION NAME> <SUBSCRIPTION ID>
#     EG.    sh create-peering.sh SUB-PBM-PRBTS 4c71e08a-d730-42f0-9a42-5f1ccf92c3f2
####################################################################

if [ "$#" -ne 2 ]; then
    echo "Please add 2 arguments, Subscription Name and Subscription ID. Eg: sh create-peering.sh SUB-PBM-PRBTS 4c71e08a-d730-42f0-9a42-5f1ccf92c3f2"
    exit
fi


mkdir securehub/VAR_FILES/SPOKES/$1_DNS_PEERING

mkdir securehub/SPOKES/$1_DNS_PEERING

PART=(${1//-/ })

cat << EOF > securehub/SPOKES/$1_DNS_PEERING/main.tf

############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   MAIN
############################################################

####################################################
# SUBSCRIPTION PROVIDER
####################################################
provider "azurerm" {
  subscription_id = var.subscription_id_one

  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }
  }
}

####################################################
# SUBSCRIPTION PROVIDER
####################################################
provider "azurerm" {
  alias           = "two"
  subscription_id = var.subscription_id_two

  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }
  }
}

###################################################
# Terraform Config
###################################################
terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "saterraformstate6671"
    container_name       = "terraformstates"
    key                  = "$1_DNS_PEERING.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.92.0"
    }
  }
  required_version = ">= 0.14.3, <=14.6"
}

EOF

cat << EOF > securehub/VAR_FILES/SPOKES/$1_DNS_PEERING/peering.tfvars

############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Virtual Network Peers
############################################################

############################################################
# Subscription Pair
############################################################
# SUB-${PART[1],,}-{PART[2],,}
subscription_id_one = "$2" 
/* peer-two remote_virtual_network_id */

# CVS-SECUREHUB000
subscription_id_two = "59b2cd00-9406-4a41-a772-e073dbe19796" 
/* peer-one remote_virtual_network_id (currently set to CVS-SECUREHUB000) */

############################################################
# VNET PEERS
############################################################
vnet_peering = {
  DevPeerSet = {
    peer-one = {
      name = {
        caf_prefix  = "peer-"
        lob         = "${PART[1],,}"
        type        = "app"
        hub_spk     = "spk"
        appid       = "${PART[2],,}"
        environment = "dev"
        index       = "000"
      }
      resource_group_name          = "rg-${PART[1],,}ntwkspk${PART[2],,}dev000"
      virtual_network_name         = "vnet-${PART[1],,}corespk${PART[2],,}dev000"
      remote_virtual_network_id    = "/subscriptions/59b2cd00-9406-4a41-a772-e073dbe19796/resourceGroups/rg-cvsntwkhub000/providers/Microsoft.Network/virtualNetworks/vnet-cvshub000"
      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }
    peer-two = {
      name = {
        caf_prefix  = "peer-"
        lob         = "${PART[1],,}"
        type        = "core"
        hub_spk     = "hub"
        appid       = "${PART[2],,}"
        environment = "dev"
        index       = "000"
      }
      resource_group_name          = "rg-cvsntwkhub000"
      virtual_network_name         = "vnet-cvshub000"
      remote_virtual_network_id    = "/subscriptions/f502c51f-dea4-4b90-9d7a-f157aa3e9d02/resourceGroups/rg-${PART[1],,}ntwkspk${PART[2],,}dev000/providers/Microsoft.Network/virtualNetworks/vnet-${PART[1],,}corespk${PART[2],,}dev000"      allow_virtual_network_access = true
      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = false
    }
  }
}

EOF

touch securehub/VAR_FILES/SPOKES/$1_DNS_PEERING/.gitkeep

touch securehub/SPOKES/$1_DNS_PEERING/.gitkeep