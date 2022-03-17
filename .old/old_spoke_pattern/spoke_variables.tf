############################################################
# Company:        CVS
# Code by:        Christopher Cooper
# Version         1.0
# Date Modified:  1/1/2020
# Description :   Subscription Variables Values
############################################################

#############################################################
# Location
#############################################################
variable "location" {
  description = "Location of the Resources - Current Locations (eastus, westus2)"
  type        = string
}

#############################################################
# DR LOCATION
#############################################################
variable "dr_location" {
  description = "DR Location of Resources - Current Locations (eastus, westus2)"
  type        = string
}

