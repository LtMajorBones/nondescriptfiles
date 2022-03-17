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
variable "aks_clusters" {
  description = "AKS Clusters"
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
    primary_location = bool

    resource_group_key = string
    subnet_key         = string

    node_availability_zones = list(string)

    node_pool_name = string
    node_count     = number
    vm_size        = string

    network_plugin = string

    deploy_rbac = bool
    deploy_osm  = bool

    deploy_agic                 = bool
    agic_subnet_key             = string
    max_pods                    = number
    private_cluster_enabled     = bool
    use_private_dns_zone        = bool
    role_based_access_control   = bool
    azure_active_directory      = bool
    enable_log_analytics        = bool
    log_analytics_workspace_key = string
  }))
}