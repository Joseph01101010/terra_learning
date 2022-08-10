# Resource 2: Create virtual network
resource "azurerm_virtual_network" "terraform_test_vnet1" {
    name = "terraform-test-vnet-1"
    resource_group_name = azurerm_resource_group.terraform_test_resource.name
    location            = azurerm_resource_group.terraform_test_resource.location
    address_space       = [ "10.0.0.0/16" ]
    tags = {
        environment = "staging"
        virtual_network = "terraform_test_vnet1"
    }
}

# Resource 3: Create subnet

resource "azurerm_subnet" "terraform_test_subnet1" {
    name                 = "terraform-test-subnet-1"
    resource_group_name  = azurerm_resource_group.terraform_test_resource.name
    virtual_network_name = azurerm_virtual_network.terraform_test_vnet1.name
    address_prefixes     = [ "10.0.2.0/24" ]
}

# Resource 4: Create public ip address

resource "azurerm_public_ip" "terraform_test_publicip1" {
    name                = "terraform-test-publicip-1"
    resource_group_name = azurerm_resource_group.terraform_test_resource.name
    location            = azurerm_resource_group.terraform_test_resource.location
    allocation_method   = "Static"
    tags = {
        environment = "staging"
        virtual_network = "terraform_test_vnet1"
    }
}

# Resource 5: Create network interface

resource "azurerm_network_interface" "terraform_test_vmnic1" {
    name                        = "vmnic1"
    resource_group_name         = azurerm_resource_group.terraform_test_resource.name
    location                    = azurerm_resource_group.terraform_test_resource.location
    ip_configuration {
        name                    = "internal"
        subnet_id               = azurerm_subnet.terraform_test_subnet1.id
        public_ip_address_id    = azurerm_public_ip.terraform_test_publicip1.id
        private_ip_address_allocation   = "Dynamic"
        
    }
}