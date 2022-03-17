/*
* Written by: Christopher Cooper
* Version 1.0
* Date Modified: 11/20/2020
* Description : Monitoring Diagnostics Variables
*/

##########################################################################
# Diagnostics Objects
#
#
# Use Example
# diagnostic_objects = {
#   log = [
#       #["Category name",  "Diagnostics Enabled(true/false)"] 
#    ]
#   metric = [
#       #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]      
#   ] 
#}
##########################################################################
variable "subscription_diagnostic_objects" {
  description = "Diagnostic Objects = { log = [#[\"Category Name\", \"Diagnostic Enabled(true/false)\", \"Retention Enabled (true/false)\", \"Retention Period\"]] metric = [#[\"Category Name\", \"Diagnostic Enabled(true/false)\", \"Retention Enabled (true/false)\", \"Retention Period\"]]"
  type        = map(any)
  default = {
    log = [
      #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
      ["Administrative", true],
      ["Security", true],
      ["ServiceHealth", true],
      ["Alert", true],
      ["Recommendation"],
      ["Policy", true],
      ["Autoscale", true],
      ["ResourceHealth", true]
    ]
    metric = []
  }
}

##########################################################################
# Log Analytic Workspace Key
##########################################################################
variable "log_analytics_workspace_key" {
  description = "Log Analytics Workspace Key"
  type        = string
}