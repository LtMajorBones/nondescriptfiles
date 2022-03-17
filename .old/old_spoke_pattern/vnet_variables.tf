############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Virtual Network Variables
############################################################

############################################################
# VNETS
############################################################
variable "vnets" {
  description = "Virtual Networks"
  type = map(object({
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
    primary_location   = bool
    resource_group_key = string
    cidr_range         = list(string)
    bgp_community      = string
    ddos_protection_plan = map(object(
      {
        ddos_protection_plan_id      = string
        ddos_protection_plan_enabled = bool
      }
    ))
    dns_servers           = list(string)
    vm_protection_enabled = bool
    tag_EnvironmentType   = string
  }))
}