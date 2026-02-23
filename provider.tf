terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ab_bknd"
    storage_account_name = "abhibknd"
    container_name       = "abhibkndcon"
    key                  = "abhi1.tfstate"
    subscription_id      = "538f56b2-294c-4e41-a854-7ab1b5d5ad51"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "538f56b2-294c-4e41-a854-7ab1b5d5ad51"
}