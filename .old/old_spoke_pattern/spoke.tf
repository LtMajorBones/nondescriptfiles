/*
* Written by: Christopher Cooper
* Version 1.0
* Date Modified: 2/8/2021
* Description : Spoke
*/

module "provision_spoke" {
  source = "../../SPOKE"

  ##########################################
  # TAGS
  ##########################################
  tag_CostCenter         = var.tag_CostCenter
  tag_DataClassification = var.tag_DataClassification
  tag_ReportingSegment   = var.tag_ReportingSegment
  tag_EnvironmentType    = var.tag_EnvironmentType
  tag_BusinessUnit       = var.tag_BusinessUnit
  tag_RiskRanking        = var.tag_RiskRanking
  tag_ApplicationName    = var.tag_ApplicationName
  tag_ComplianceCategory = var.tag_ComplianceCategory
  tag_ResourceOwner      = var.tag_ResourceOwner
  tag_DisasterTier       = var.tag_DisasterTier
  tag_BusinessFirewall   = var.tag_BusinessUnit
  tag_CreatedBy          = var.tag_CreatedBy
  ##########################################
  # LOCATION
  ##########################################
  location = var.location
  ##########################################
  # DR LOCATION
  ##########################################
  dr_location = var.dr_location
  ##########################################
  # Tenant ID
  ##########################################
  tenant_id = data.azurerm_client_config.current.tenant_id
  ##########################################
  # Resource Groups
  ##########################################
  resource_groups = var.resource_groups
  ##########################################
  # VNets
  ##########################################
  vnets = var.vnets
  ##########################################
  # SUBNETS
  ##########################################
  subnets = var.subnets
  ##########################################
  # ROUTE TABLES
  ##########################################
  route_tables = var.route_tables
  ##########################################
  # BASTIONS
  ##########################################
  bastions = var.bastions
  ##########################################
  # Log Analytics Workspaces
  ##########################################
  log_analytics_workspaces = var.log_analytics_workspaces
  ##########################################
  # Subscription Diagnostics
  ##########################################
  subscription_diagnostic_objects = var.subscription_diagnostic_objects
  ##########################################
  # Subscription Diagnostics Log Analytics Workspace Key
  ##########################################
  log_analytics_workspace_key = var.log_analytics_workspace_key
  ##########################################
  # Key Vaults
  ##########################################
  key_vaults              = var.key_vaults
  aks_clusters            = var.aks_clusters
  network_security_groups = var.network_security_groups
}