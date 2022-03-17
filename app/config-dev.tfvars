#RG
resource_group_name = "rg-infradev000"
location            = "eastus2"

#ASP
asp_name = "asp-infradev000"
asp_kind = "linux"

#INSIGHTS
app_insights_name = "ins-infradev000"

#APPSVC
appsvc_name = "appsvc-infradev000"
appsvc_settings = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "!!sensitive_Key!!"
  sensitive_key1                 = "P@ssw0rd01"
  sensitive_key2                 = "P@ssw0rd02"
}

#ACR
acr_name = "acr-infradev000"