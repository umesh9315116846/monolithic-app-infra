terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    }
    backend "azurerm" {
      resource_group_name  = "rg_servicetest"
      storage_account_name = "testrg0004storageaccount"
      container_name       = "backendcontainer"
      key                  = "dev.terraform.tfstate"
    
    }
}

provider "azurerm" {
  features {}
  subscription_id = "eab63ffb-bf3a-4d0f-b9f7-d3c577ca3158"
}