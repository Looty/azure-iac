# Azure Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.project_name
  location = var.project_region
  tags     = var.project_tags
}