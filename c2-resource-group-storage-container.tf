
resource "azurerm_resource_group" "terraform_test_resource" {
    name = "terraform_test_resource-1"
    location = "West Europe"

    tags = {
        environment = "staging"
    }
}

# Resource 2: Random string

resource "random_string" "testrandom" {
    length = 7
    special = false
    upper = false
}

# Resource 3: Azure Storage Account

resource "azurerm_storage_account" "terraform_test_sa" {
    name = "terraformtestsa${random_string.testrandom.id}"
    resource_group_name = azurerm_resource_group.terraform_test_resource.name
    location = azurerm_resource_group.terraform_test_resource.location
    account_tier = "Standard"
    account_replication_type = "GRS"

    tags = {
        environment = "staging"
    }
}

resource "azurerm_storage_encryption_scope" "terraform_test_sae_scope" {
    name = "microsoftmanaged"
    storage_account_id = azurerm_storage_account.terraform_test_sa.id
    source = "Microsoft.Storage"
}