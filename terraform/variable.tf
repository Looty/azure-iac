variable "project_name" {
  type    = string
  default = "azure-iac"
}

variable "project_region" {
  type    = string
  default = "West Europe"
}

variable "project_tags" {
  type = map(any)
  default = {
    "project"     = "azure-iac"
    "environment" = "dev"
    "source"      = "terraform"
  }
  description = "The flags of the resources"
}

variable "windows_vm_credentials" {
  default = {
    admin_username = "adminuser"
    admin_password = "Aa123456!"
  }
  type = object(
    { admin_username = string, admin_password = string }
  )
}

variable "windows_vm_os_disk" {
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  type = object(
    { caching = string, storage_account_type = string }
  )
}

variable "windows_vm_image" {
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  type = object(
    { publisher = string, offer = string, sku = string, version = string }
  )
}

variable "windows_vm_type" {
  type    = string
  default = "Standard_B1s"
}

variable "virtual_network_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vm_subnet_name" {
  type    = string
  default = "internal"
}

variable "vm_subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "vm_public_ip_allocation_method" {
  type    = string
  default = "Dynamic"
}

variable "network_interface_ip_configuration_name" {
  type    = string
  default = "internal"
}

variable "network_interface_private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "source_address_prefix" {
  type = string
}