terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "dbc44e07-0c52-4013-97e5-e416090c2bea"
  # Configuration options
}

data "azurerm_client_config" "current" {}
