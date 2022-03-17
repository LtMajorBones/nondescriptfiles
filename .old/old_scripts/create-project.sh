
############################################################################################
#     USAGE: bash create-project.sh <SUBSCRIPTION NAME> <Subscription ID>
#     EG.    bash create-project.sh SUB-PBM-PRBTS 4c71e08a-d730-42f0-9a42-5f1ccf92c3f2
#     
#     Modified: 12/28/2021
#     Engineer: BS
#     Notes: Addition of 'var' entries for "lob" and "AppID"
#############################################################################################



if [ "$#" -ne 2 ]; then
    echo "Please add 2 arguments, Subscription Name and Subscription ID. Eg: sh create-project.sh SUB-PBM-PRBTS 4c71e08a-d730-42f0-9a42-5f1ccf92c3f2"
    exit
fi

mkdir securehub/VAR_FILES/SPOKES/$1

mkdir securehub/SPOKES/$1

PART=(${1//-/ })

cat << EOF > securehub/VAR_FILES/SPOKES/$1/spoke.tfvars

#############################################
# SUBSCRIPTION AND LOCATION INFORMATION
#############################################
location        = "eastus2"
dr_location     = "centralus"

#############################################
# TAGS
#############################################
tag_CostCenter         = "190337"
tag_ApplicationName    = "${PART[2],,}"
tag_Applicationitpmid  = ""
tag_DTCMigration       = ""
tag_ITPR               = ""
tag_responsible_svp    = ""
tag_ReportingSegment   = "Retail_LTC"
tag_BusinessUnit       = "MinuteClinic"
tag_EnvironmentType    = "Prod"
tag_EnvironmentSubType = ""
tag_ResourceOwner      = "Herman Nord"
tag_SharedEmailAddress = "Herman.Nord@CVSHealth.com"
tag_DataClassification = "Restricted"

## NOT REQUIRED ##
tag_DisasterTier       = "4h:4h"
tag_RiskRanking        = "High"
tag_BusinessFirewall   = "No"
tag_ComplianceCategory = "PII"
tag_CreatedBy          = "Terraform Automation"

#############################################
# RESOURCE GROUPS
#############################################
resource_groups = {
  /* Dev Network 0*/
  DevNetwork000 = {
    name = {
      caf_prefix  = "rg-"
      lob         = "${PART[1],,}"
      type        = "ntwk"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "dev"
      index       = "000"
    }
    primary_location    = true
    tag_EnvironmentType = "DEV"
  }
  /* Prod Network 0*/
  ProdNetwork000 = {
    name = {
      caf_prefix  = "rg-"
      lob         = "${PART[1],,}"
      type        = "ntwk"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "000"
    }
    primary_location    = true
    tag_EnvironmentType = "PROD"
  }
  /* Backup Resource Groups */
  DevBackup000 = {
    name = {
      caf_prefix  = "rg-"
      lob         = "${PART[1],,}"
      type        = "bkp"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "dev"
      index       = "000"
    }
    primary_location    = true
    tag_EnvironmentType = "DEV"
  }
  ProdBackup000 = {
    name = {
      caf_prefix  = "rg-"
      lob         = "${PART[1],,}"
      type        = "bkp"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "000"
    }
    primary_location    = true
    tag_EnvironmentType = "DEV"
  }
  /* Security Resource Group */
  SecurityResourceGroup = {
    name = {
      caf_prefix  = "rg-"
      lob         = "${PART[1],,}"
      type        = "secr"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "000"
    }
    primary_location    = true
    tag_EnvironmentType = "PROD"
  }
}

############################################################
# VNETS
############################################################
vnets = {
  VirtualNetworkDev = {
    name = {
      caf_prefix  = "vnet-"
      lob         = "${PART[1],,}"
      type        = "core"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "dev"
      index       = "000"
    }
    primary_location      = true
    resource_group_key    = "DevNetwork000"
    cidr_range            = ["0.0.0.0/24"]
    bgp_community         = ""
    ddos_protection_plan  = {}
    dns_servers           = ["10.155.40.7","10.155.40.8"]
    vm_protection_enabled = false
    tag_EnvironmentType   = "DEV"
  }
  VirtualNetworkProd = {
    name = {
      caf_prefix  = "vnet-"
      lob         = "${PART[1],,}"
      type        = "core"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "000"
    }
    primary_location      = true
    resource_group_key    = "ProdNetwork000"
    cidr_range            = ["0.0.0.0/24"]
    bgp_community         = ""
    ddos_protection_plan  = {}
    dns_servers           = ["10.155.40.7","10.155.40.8"]
    vm_protection_enabled = false
    tag_EnvironmentType   = "PROD"
  }
}

############################################################
# SUBNETS
############################################################
subnets = {
  ##########################################################
  # Development
  ##########################################################
  DevelopmentApp000 = {
    name = {
      caf_prefix                 = "snet-"
      lob                        = "${PART[1],,}"
      type                       = "app"
      hub_spk                    = "spk"
      appid                      = "${PART[2],,}"
      environment                = "dev"
      index                      = "000"
      azure_specific_subnet_name = ""
    }
    resource_group_key  = "DevNetwork000"
    virtual_network_key = "VirtualNetworkDev"
    cidr = {
      vnet_cidr_index = 0
      cidr_newbits    = 1
      cidr_netnum     = 0
    }
    delegations       = {}
    service_endpoints = ["Microsoft.Storage"]
    enforce_private_link_endpoint_network_policies = true
  }
  ProductionApp000 = {
    name = {
      caf_prefix                 = "snet-"
      lob                        = "${PART[1],,}"
      type                       = "app"
      hub_spk                    = "spk"
      appid                      = "${PART[2],,}"
      environment                = "prod"
      index                      = "000"
      azure_specific_subnet_name = ""
    }
    resource_group_key  = "ProdNetwork000"
    virtual_network_key = "VirtualNetworkProd"
    cidr = {
      vnet_cidr_index = 0
      cidr_newbits    = 1
      cidr_netnum     = 0
    }
    delegations       = {}
    service_endpoints = ["Microsoft.Storage"]
    enforce_private_link_endpoint_network_policies = true
  }

}

############################################################
# ROUTE TABLES
############################################################
route_tables = {
  #   DevNetwork000 = {
  #       name = {
  #         route_table_caf_prefix     = "rt-"
  #         route_table_lob            = "${PART[1],,}"
  #         route_table_type           = "ntwk"
  #         route_table_hub_spk        = "spk"
  #         route_table_application_id = "${PART[2],,}"
  #         route_table_environment    = "dev"
  #         route_table_index          = "000"
  #         route_table_unique_name    = "DevNetwork000"
  #       }
  #   resource_group_key                        = "DevNetwork000"
  #   primary_location                          = true
  #   route_table_disable_bgp_route_propagation = false
  #   subnet_keys = {
  #     subnet_key000 = "DevelopmentApp000"
  #   }
  #   routes = {
  #     InternetEgress = {
  #       name                   = "NVAEgress"
  #       address_prefix         = "0.0.0.0/0"
  #       next_hop_type          = "VirtualAppliance"
  #       next_hop_in_ip_address = "10.155.62.4"
  #     }
  #   }
  # }
  #   ProdNetwork000 = {
  #       name = {
  #         route_table_caf_prefix     = "rt-"
  #         route_table_lob            = "${PART[1],,}"
  #         route_table_type           = "ntwk"
  #         route_table_hub_spk        = "spk"
  #         route_table_application_id = "${PART[2],,}"
  #         route_table_environment    = "prod"
  #         route_table_index          = "000"
  #         route_table_unique_name    = "ProdNetwork000"
  #       }
  #   resource_group_key                        = "ProdNetwork000"
  #   primary_location                          = true
  #   route_table_disable_bgp_route_propagation = false
  #   subnet_keys = {
  #     subnet_key000 = "ProductionApp000"
  #   }
  #   routes = {
  #     InternetEgress = {
  #       name                   = "NVAEgress"
  #       address_prefix         = "0.0.0.0/0"
  #       next_hop_type          = "VirtualAppliance"
  #       next_hop_in_ip_address = "10.155.62.4"
  #     }
  #   }
  # }
}
#######################################################
# BASTIONS
#######################################################
bastions = {
}

############################################################
# Log Analytics Workspaces
############################################################
log_analytics_workspaces = {
  loganalytics000 = {
    name = {
      caf_prefix  = "log-"
      lob         = "${PART[1],,}"
      type        = "core"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "000"
    }
    primary_location          = true
    resource_group_key        = "SecurityResourceGroup"
    lawkspc_sku               = "PerNode"
    lawkspc_retention_in_days = "30"
  }

}

###########################################
# Subscription Diagnostic
###########################################
subscription_diagnostic_objects = {

  log = [
    #["Category name",  "Diagnostics Enabled(true/false)"] 
    ["Administrative", true],
    ["Security", true],
    ["ServiceHealth", true],
    ["Alert", true],
    ["Recommendation", true],
    ["Policy", true],
    ["Autoscale", true],
    ["ResourceHealth", true]
  ]
  metric = []
  
}
log_analytics_workspace_key = "loganalytics000"

############################################################
# Key Vaults
############################################################
key_vaults = {
  SecurityKeyVault000 = {
    name = {
      caf_prefix  = "kv-"
      lob         = "${PART[1],,}"
      type        = "core"
      hub_spk     = "spk"
      appid       = "${PART[2],,}"
      environment = "prod"
      index       = "0"
    }
    resource_group_key                    = "SecurityResourceGroup"
    primary_location                      = true
    tag_EnvironmentType                   = "PROD"
    key_vault_enable_for_disk_encryption  = true
    key_vault_soft_delete_retention_days  = 7
    key_vault_purge_protection_enabled    = true
    key_vault_sku_name                    = "standard"
    key_vault_network_acls_default_action = "Deny"
    key_vault_network_acls_bypass         = "AzureServices"
  }
}
network_security_groups = {
}
aks_clusters = {
}
EOF

cat << EOF > securehub/SPOKES/$1/main.tf
/*
* Written by: Christopher Cooper
* Version 1.0
* Date Modified: 9/30/2020
* Description : Main
*/

####################################################
# SPOKE PROVIDER
####################################################
provider "azurerm" {
  subscription_id = "$2"

  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }
  }
}

data "azurerm_client_config" "current" {
}

###################################################
# Terraform Config
###################################################
terraform {
  experiments = [module_variable_optional_attrs]
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "saterraformstate6671"
    container_name       = "terraformstates"
    key                  = "$1.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
  required_version = ">= 0.14.3, <=14.6"
}
EOF

touch securehub/VAR_FILES/SPOKES/$1/.gitkeep

touch securehub/SPOKES/$1/.gitkeep