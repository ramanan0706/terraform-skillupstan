variable "resource_group_name" {
  type = string
  default = "terraform-rg-01"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "virtual_network_name" {
    type = string
    default = "dev-vm-network-01"
}

variable "subnet_name" {
    type = string
    default = "default"
}

variable "network_interface_name" {
  type = string
}

variable "network_sg_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "disk_name" {
  type = string
}

variable "disk_size" {
  type = string
}