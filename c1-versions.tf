
terraform {
  required_providers {
    
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.17.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "500cebd9-6205-4ba8-8b1d-94f3c8b32d32"
  tenant_id       = "c66b6765-b794-4a2b-84ed-845b341c086a"
}

# Test multiple providers

provider "azurerm" {
    features {}
    alias = "provider2-northeurope"
}