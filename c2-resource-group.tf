
resource "azurerm_resource_group" "terraform_test_resource" {
    name = "terraform_test_resource-1"
    location = "West Europe"
}

# Test multiple providers and resource groups

resource "azurerm_resource_group" "terraform_test_resource2" {
    name = "terraform_test_resource-2"
    location = "northeurope"
    provider = azurerm.provider2-northeurope
}
