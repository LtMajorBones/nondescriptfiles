############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Key Vaults Variables
############################################################


############################################################
#    Key Vaults
#############################################################
variable "key_vaults" {
  description = "Key Vaults"
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
    resource_group_key                    = string
    primary_location                      = bool
    tag_EnvironmentType                   = string
    key_vault_enable_for_disk_encryption  = bool
    key_vault_soft_delete_retention_days  = number
    key_vault_purge_protection_enabled    = bool
    key_vault_sku_name                    = string
    key_vault_network_acls_default_action = string
    key_vault_network_acls_bypass         = string
  }))
}
