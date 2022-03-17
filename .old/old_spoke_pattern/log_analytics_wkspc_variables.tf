############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Subscription Log Analytics Workspaces Variables
############################################################

############################################################
# Log Analytics Workspaces
############################################################
variable "log_analytics_workspaces" {
  description = "Log Analytics Workspaces"
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
    primary_location          = bool
    resource_group_key        = string
    lawkspc_sku               = string
    lawkspc_retention_in_days = string
  }))
}
