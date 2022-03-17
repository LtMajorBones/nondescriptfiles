############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Tag Variables
############################################################

/* Cost Center */
variable "tag_CostCenter" {
  description = "Cost Center Code"
  type        = string
  default     = ""
}

/* Application Name */
variable "tag_ApplicationName" {
  description = "Application Name"
  type        = string
  default     = ""
}

/* Application ITPM ID */
variable "tag_Applicationitpmid" {
  description = "Application ITPM ID"
  type        = string
  default     = ""
}

/* DTC Migration */
variable "tag_DTCMigration" {
  description = "DTC Migration"
  type        = string
  default     = ""
}

/* ITPR */
variable "tag_ITPR" {
  description = "ITPR"
  type        = string
  default     = ""
}

/* Responsible SVP */
variable "tag_responsible_svp" {
  description = "IT SVP of the Business Unit"
  type        = string
  default     = ""
}

/* Reporting */
variable "tag_ReportingSegment" {
  description = "Reporting Segment"
  type        = string
  default     = ""
}

/* Business Unit */
variable "tag_BusinessUnit" {
  description = "Business Unit"
  type        = string
  default     = ""
}

/* Environment */
variable "tag_EnvironmentType" {
  description = "Environment"
  type        = string
  default     = ""
}

/* Environment Sub Type*/
variable "tag_EnvironmentSubType" {
  description = "Environment Sub Type"
  type        = string
  default     = ""
}

/* Resource Owner */
variable "tag_ResourceOwner" {
  description = "Resource Owner"
  type        = string
  default     = ""
}

/* Shared Email Address */
variable "tag_SharedEmailAddress" {
  description = "Shared Team Email Address - Prod Support / VM Issues"
  type        = string
  default     = ""
}

/* Data Classification */
variable "tag_DataClassification" {
  description = "Data Classification"
  type        = string
  default     = ""
}

## NOT REQUIRED ##
/* Disaster Tier */
variable "tag_DisasterTier" {
  description = "Disaster Recovery Tier"
  type        = string
  default     = ""
}

/* Risk Ranking */
variable "tag_RiskRanking" {
  description = "Risk Ranking"
  type        = string
  default     = ""
}

/* Business Firewall */
variable "tag_BusinessFirewall" {
  description = "Business Firewall"
  type        = string
  default     = ""
}

/* Compliance Category */
variable "tag_ComplianceCategory" {
  description = "Compliance Category"
  type        = string
  default     = ""
}

/* Created By */
variable "tag_CreatedBy" {
  description = "Created By"
  type        = string
  default     = ""
}

