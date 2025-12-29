terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    }
    backend "azurerm" {
      resource_group_name  = "rg_servicetest"
      storage_account_name = "testrg0002storageaccount"
      container_name       = "backendcontainer"
      key                  = "dev.terraform.tfstate"
    
    }
}

provider "azurerm" {
  features {}
  subscription_id = "792b5051-461b-4568-abbd-b3d549f22f8c"
}