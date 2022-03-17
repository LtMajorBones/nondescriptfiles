############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   ROUTE TABLE VARIABLES
############################################################

################################################
# ROUTE TABLES
################################################
variable "route_tables" {
  description = "Default Route Table Definitions"
  type = map(object(
    {
      name = object(
        {
          route_table_caf_prefix     = string
          route_table_lob            = string
          route_table_type           = string
          route_table_hub_spk        = string
          route_table_application_id = string
          route_table_environment    = string
          route_table_index          = string
          route_table_unique_name    = string
        }
      )
      resource_group_key                        = string
      primary_location                          = bool
      route_table_disable_bgp_route_propagation = bool
      subnet_keys                               = map(string)
      routes = map(object(
        {
          name                   = string
          address_prefix         = string
          next_hop_type          = string
          next_hop_in_ip_address = string
        }
      ))
    }
  ))
}
