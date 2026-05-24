data "terraform_remote_state" "internal_appgw" {
  backend = "azurerm"

  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesameer"
    container_name       = "tfstate"
    key                  = "dev-internalappgw.tfstate"
  }
}