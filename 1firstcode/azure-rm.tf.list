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

resource "azurerm_resource_group" "az_rg" { # Resource BLOCK
  count    = length(var.rg_name)
  name     = var.rg_name[count.index]                    # Argument
  location = var.rg_location                # Arugement
  tags = {
    #environment ="Demo" # Argument
    environment = var.rg_env[count.index] # Argument
  }
}



 