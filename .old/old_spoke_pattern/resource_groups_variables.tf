############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Resource Groups Variable File
############################################################

############################################################
#    Resource Groups
#############################################################
variable "resource_groups" {
  description = "Resource Groups"
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
    primary_location    = bool
    tag_EnvironmentType = string
  }))
}