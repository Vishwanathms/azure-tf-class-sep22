
variable "rg_name" {
  description = "Provide the ResourceGroup name on Azure"
  type        = list
}

variable "rg_location" {
  description = "Provide the ResourceGroup Location on Azure"
  type        = list
  default     = ["East US"]
}

variable "pip_name" {
  description = "Provide the Azure PIP name"
  type        = string
}

variable "create_pip" {
  description = "True/false for creating PIP"
  type        = bool
}