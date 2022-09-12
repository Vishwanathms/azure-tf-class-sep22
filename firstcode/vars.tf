
variable "rg_name" {
  description = "Provide the ResourceGroup name on Azure"
  type        = list
}

variable "rg_location" {
  description = "Provide the ResourceGroup Location on Azure"
  type        = string
  default     = "East US"
}