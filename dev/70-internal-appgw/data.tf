data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesameer"
    container_name       = "tfstate"
    key                  = "dev-network.tfstate"
  }
}



data "terraform_remote_state" "vmss" {
  backend = "azurerm"

  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesameer"
    container_name       = "tfstate"
    key                  = "dev-app.tfstate"
  }
}