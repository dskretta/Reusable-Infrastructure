variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "Project-2-resource-group"
}

variable "location" {
  description = "Azure region for resources"
  default     = "West US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  default     = "Project-2-vnet"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "Project-2-subnet"
}

variable "nsg_name" {
  description = "Name of the network security group"
  default     = "Project-2-nsg"
}
