resource_group_name = "rg-infratst000"
location            = "eastus2"
key_vault_name      = "9718448-rg-infratst000"
use_rbac_mode       = true
tags = {
  terraformDeployment = "true",
  GithubRepo          = "https://github.com/9718448/securehubv2"
  Environment         = "TEST"
}