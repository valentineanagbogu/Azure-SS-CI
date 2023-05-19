terraform {
  required_providers {
    azurerm = {

      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "valentineanagbogu"

    workspaces {
      name = "azure-secure-storage"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true

}

resource "azurerm_resource_group" "rg" {
  name     = "testrgwithsecurestorage"
  location = "South Central US"

}

module "securestorage" {
  source               = "app.terraform.io/valentineanagbogu/securestorage/azure"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "bombasticsideeye0100"
}