
variable "rg_name" {
  description = "Provide the ResourceGroup name on Azure"
  type        = list
  default = ["RG-0001"]
}


/*variable "rg_location" {
  description = "Provide the ResourceGroup Location on Azure"
  type        = list
  default     = ["East US"]
}*/




variable "namestn" {
  type        = map
  default = {
    "eastus"  = "eus-rg"
    "westus"  = "wus-rg"
  }
}
