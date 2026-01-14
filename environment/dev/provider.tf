terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    }
    backend "azurerm" {
      resource_group_name  = "rg_servicetest"
      storage_account_name = "testrg0003storageaccount"
      container_name       = "backendcontainer"
      key                  = "dev.terraform.tfstate"
    
    }
}

provider "azurerm" {
  features {}
  subscription_id = "310dec27-9d1f-4f6d-8cc0-356278cce859"
}