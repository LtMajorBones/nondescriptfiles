############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Azure Bastion Variables
############################################################

############################################################
# Bastions
############################################################
variable "bastions" {
  description = "Azure Bastion Configurations"
  type = map(object(
    {
      resource_group_key = string
      primary_location   = bool
      pip = object(
        {
          name = object(
            {
              caf_prefix  = string
              lob         = string
              type        = string
              hub_spk     = string
              appid       = string
              environment = string
              index       = string
            }
          )
          pip_sku               = string
          pip_allocation_method = string
          pip_version           = string
        }
      )
      bastion = object(
        {
          name = object(
            {
              caf_prefix  = string
              lob         = string
              type        = string
              hub_spk     = string
              appid       = string
              environment = string
              index       = string
          })
          bastion_ip_configuration_name       = string
          bastion_ip_configuration_subnet_key = string
        }
      )
    }
  ))
}
