terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.12.0" # The latest version due to issues with 4.1.0 as documented
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"

  subscription_id = "Insert Subscription ID Here"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "Project-2-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_A2_v2"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pem.pub")
  }
}
