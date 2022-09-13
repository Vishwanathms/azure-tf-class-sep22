
variable "rg_name" {
  description = "Provide the ResourceGroup name on Azure"
  type        = list
  default = ["RG-0001"]
}

variable "rg_env" {
  description = "Provide the ResourceGroup name on Azure"
  type        = string
}

variable "pip_name" {
  description = "Provide the Azure PIP name"
  type        = string
}

variable "create_pip" {
  description = "True/false for creating PIP"
  type        = bool
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
