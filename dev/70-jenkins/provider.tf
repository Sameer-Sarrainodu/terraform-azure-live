terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesameer"
    container_name       = "tfstate"
    key                  = "dev-jenkins.tfstate"
  }
}

provider "azurerm" {
  features {}
resource_provider_registrations = "none"
}