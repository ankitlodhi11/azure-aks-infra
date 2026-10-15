terraform {
  required_version = ">= 1.13.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "anuj-rg-bc"
    storage_account_name = "anujstatefile123"
    container_name       = "tfstate"
    key                  = "anuj.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b83d647a-468f-4198-a5d6-44ea2c5c8bf3"
}
