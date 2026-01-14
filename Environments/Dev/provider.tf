terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rajat-practice-RG"
    storage_account_name = "rajatpracticestorage0"
    container_name       = "statefiles"
    key                  = "dev.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c1c0072a-4263-4e7d-b569-5f129c384ed5"
}

data "azurerm_client_config" "current" {}
