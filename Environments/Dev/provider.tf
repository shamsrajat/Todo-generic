terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = "add0fa15-bc55-4925-94ff-33e12b9104b0"
}

data "azurerm_client_config" "current" {}
