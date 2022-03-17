resource_group_name = "rg-infradev000"
location            = "eastus2"

storage_config = [
  #V2 Storage
  {
    name                      = "sa-v2infradev000"
    account_kind              = "StorageV2"
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = true
    access_tier               = "Cool"
    is_hns_enabled            = false
  },
  #ADLS2 Storage
  {
    name                      = "sa-adls2infradev000"
    account_kind              = "BlockBlobStorage"
    account_tier              = "Premium"
    account_replication_type  = "ZRS"
    min_tls_version           = "TLS1_2"
    enable_https_traffic_only = false
    access_tier               = "Hot"
    is_hns_enabled            = true
  }
]

tags = {
  terraformDeployment = "true",
  GithubRepo          = "https://github.com/9718448/securehubv2"
  Environment         = "DEV"
}