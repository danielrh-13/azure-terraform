/*resource "azurerm_resource_group" "myRg" {
  name     = "miGruopDeResource"
  location = var.location
}*/


resource "azurerm_virtual_network" "myVnet" {
  name                = "miVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = "miGruopDeResource"
}

resource "azurerm_subnet" "mySubnet" {
  name                 = "miSubnet"
  resource_group_name  = azurerm_resource_group.myRg.name
  virtual_network_name = azurerm_virtual_network.myVnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

/*
resource "azurerm_network_security_group" "my_nsg" {
  name                = "myNSG"
  location            = var.location
  resource_group_name = azurerm_resource_group.myRg.name

  // Permitir el tráfico saliente a internet
  security_rule {
    name                       = "allow-outbound-internet"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }

  // Permitir el tráfico SSH entrante desde cualquier lugar
  security_rule {
    name                       = "allow-ssh-inbound"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  // Permitir toda comunicación interna dentro de la VNet
  security_rule {
    name                       = "allow-internal-vnet"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }
}

resource "azurerm_subnet_network_security_group_association" "my_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.mySubnet.id
  network_security_group_id = azurerm_network_security_group.my_nsg.id
}
*/
