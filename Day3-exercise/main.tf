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

data "azurerm_resource_group" "rg_name01" {
    name = "Dev-rg"
}

variable "attributes" {
  type = map(object({
    name = string
    location = string
    tags = string
  }) )
  default = {
    "a1" = {
      name = "rg01"
      location = "eastus"
      tags = "dev"
    },
    "b1" = {
      name = "rg02"
      location = "westus"
      tags = "dev"
    }
  }
}


variable "objectex01" {
  type = object({
    name = string
    location = string
    tags = string
  }) 
  default =  {
      name = "rg01"
      location = "eastus"
      tags = "dev"
    }
}


resource "azurerm_resource_group" "az_rg" { # Resource BLOCK
  #count    = length(var.rg_name)
  #name     = var.namestn[var.rg_location]
  for_each = var.attributes
  #name     = format("%s-%s", var.namestn[var.rg_location[count.index]], var.rg_name[count.index])                    # Argument
  name = each.value.name 
  #name = objectex01.name
  location = each.value.location           # Arugement
  tags = {
    #environment ="Demo" # Argument
    environment = each.value.tags # Argument
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [
        location,
        name
    ]
  }
  provisioner "local-exec" {
        #command = "echo $var1, $var2 >> env_vars.txt"
         command = ipconfig > "test.txt"
        environment = {
            var1 = "Vishwa"
            var2 = length(var.rg_name)
        }
  }
}



# example for boolean variable.



 #count  = var.create_pip ? 1 : 0

 #var1   = var.env == "prod" ? var.subnet[1] : var.subnet[2]

 #name   = var.input == "vishwa" ? cloud : infra

