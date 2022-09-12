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

variable "rg_env" {
  description = "Provide ResourceGroup Location on Azure"
  type        = list
}

variable "namestn" {
  type        = map
  default = {
    "eastus"  = "eus-rg"
    "westus"  = "wus-rg"
  }
}

resource "azurerm_resource_group" "az_rg" { # Resource BLOCK
  count    = length(var.rg_name)
  #name     = var.namestn[var.rg_location]
  name     = format("%s-%s", var.namestn[var.rg_location[count.index]], var.rg_name[count.index])                    # Argument
  location = var.rg_location[count.index]              # Arugement
  tags = {
    #environment ="Demo" # Argument
    environment = var.rg_env[count.index] # Argument
  }
}

# example for boolean variable.

resource "azurerm_public_ip" "azpip01" {
  count               = var.create_pip ? 1 : 0
  name                = var.pip_name
  resource_group_name = azurerm_resource_group.az_rg[2].name
  location            = azurerm_resource_group.az_rg[2].location
  allocation_method   = "Static"

  tags = {
    environment = var.rg_env[2]
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.az_rg[2].name
  location                 = azurerm_resource_group.az_rg[2].location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
  depends_on = [
    azurerm_public_ip.azpip01
  ]
}

output "rg_names" {
   value = azurerm_resource_group.az_rg[*].id
}

output "azpip" {
   value = azurerm_public_ip.azpip01[0].ip_address
}



 #count  = var.create_pip ? 1 : 0

 #var1   = var.env == "prod" ? var.subnet[1] : var.subnet[2]

 #name   = var.input == "vishwa" ? cloud : infra

