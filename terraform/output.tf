output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "vm_public_ip_address" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine.public_ip_address
}