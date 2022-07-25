resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.project_name}-network"
  address_space       = [var.virtual_network_cidr]
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.project_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.vm_subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.vm_subnet_cidr]
}

resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.project_name}-ip"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = var.vm_public_ip_allocation_method
  tags                = var.project_tags
}

resource "azurerm_network_interface" "network_interface" {
  name                = "${var.project_name}-nic"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = var.network_interface_ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.network_interface_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }

  tags = var.project_tags
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = "${var.project_name}-sg"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "RDP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefixes    = [var.source_address_prefix]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5986"
    source_address_prefixes    = [var.source_address_prefix]
    destination_address_prefix = "*"
  }

  tags = var.project_tags
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}