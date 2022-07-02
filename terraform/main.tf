resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                = "${var.project_name}-vm"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = var.windows_vm_type
  admin_username      = var.windows_vm_credentials.admin_username
  admin_password      = var.windows_vm_credentials.admin_password
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  os_disk {
    caching              = var.windows_vm_os_disk.caching
    storage_account_type = var.windows_vm_os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.windows_vm_image.publisher
    offer     = var.windows_vm_image.offer
    sku       = var.windows_vm_image.sku
    version   = var.windows_vm_image.version
  }

  tags = var.project_tags
}