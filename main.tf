resource "azurerm_resource_group" "abhic" {
  count    = 2
  name     = "AB_RG${count.index}"
  location = "centralindia"
}

variable "vnet" { default = "ab" }

resource "azurerm_virtual_network" "vnetr" {
  count               = 2
  name                = "${var.vnet}${count.index}"
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.abhic[0].name
  address_space       = ["10.0.0.0/16"]
}

# variable "subnet" {}

# resource "azurerm_subnet" "absub" {
#   count                = length(var.subnet)
#   name                 = var.subnet[count.index]
#   resource_group_name  = azurerm_resource_group.abhic[0].name
#   virtual_network_name = azurerm_virtual_network.vnetr[0].name
#   address_prefixes     = ["10.0.${count.index}.0/24"]
# }