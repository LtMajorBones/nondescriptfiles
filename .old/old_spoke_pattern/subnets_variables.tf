############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Hub Subnets Default Variables 
############################################################

###################################################
# SUBNETS
###################################################
variable "subnets" {
  type = map(
    object(
      {
        name = object(
          {
            caf_prefix                 = string
            lob                        = string
            type                       = string
            hub_spk                    = string
            appid                      = string
            environment                = string
            index                      = string
            azure_specific_subnet_name = string
          }
        )
        resource_group_key  = string
        virtual_network_key = string
        cidr = object(
          {
            vnet_cidr_index = number # Index of the VNET CIDRs created (Normally 0 unless more than one CIDS assigned!!!)
            cidr_newbits    = number
            cidr_netnum     = number
          }
        )
        delegations = map(object(
          {
            delegation_name           = string
            service_delegation_name   = string
            service_delegation_action = list(string)
          }
        ))
        service_endpoints                              = list(string)
        enforce_private_link_endpoint_network_policies = optional(bool)
        enforce_private_link_service_network_policies  = optional(bool)
      }
    )
  )
}

locals {
  subnets = defaults(var.subnets,
    {
      enforce_private_link_endpoint_network_policies = false
      enforce_private_link_service_network_policies  = false
    }
  )
}

