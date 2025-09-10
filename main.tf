terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>4.8.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "azurerm" {
    subscription_id = "2f75da7b-56ec-4b41-a9cb-e8f38a3cbfa7"
    features {
      
    }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
 # explicit dependency depends_on = [ azurerm_resource_group.example ]
  name                     = "techtutorials101989"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location  #implicit dependency Meaning the storage account can be created after the creation of the resource group
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}