terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "az_rg" { # Resource BLOCK
  name = "rg01-remote"
  location = "eastus"          # Arugement
  tags = {
    environment ="Dev" # Argument
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [
        location,
        name
    ]
  }
  /*provisioner "local-exec" {
        #command = "echo $var1, $var2 >> env_vars.txt"
        #command = ipconfig > "test.txt"
        environment = {
            var1 = "Vishwa"
            var2 = length(var.rg_name)
        }
  }*/


}

resource "azurerm_public_ip" "azpip01" {
  count               = var.create_pip ? 1 : 0
  name                = var.pip_name
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = azurerm_resource_group.az_rg.location
  allocation_method   = "Static"

  tags = {
    environment = var.rg_env
  }
}



# example for boolean variable.



 #count  = var.create_pip ? 1 : 0

 #var1   = var.env == "prod" ? var.subnet[1] : var.subnet[2]

 #name   = var.input == "vishwa" ? cloud : infra

