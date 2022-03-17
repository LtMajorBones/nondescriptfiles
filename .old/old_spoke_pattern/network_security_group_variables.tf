variable "network_security_groups" {
  description = "Default NSG Definitions"
  type = map(object(
    {
      name = object(
        {
          caf_prefix     = string
          lob            = string
          type           = string
          hub_spk        = string
          application_id = string
          environment    = string
          index          = string
          unique_name    = string
        }
      )
      resource_group_key = string
      primary_location   = bool
      subnet_keys        = map(string)
      rules = map(object(
        {
          name                   = string
          priority               = string
          direction              = string
          access                 = string
          protocol               = string
          source_port_range      = string
          destination_port_range = string
          #source_address_prefix = string
          source_address_prefixes      = list(string)
          destination_address_prefixes = list(string)

        }
      ))
    }
  ))
}
