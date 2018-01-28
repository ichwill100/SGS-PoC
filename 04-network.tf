# Configuration Azure Network

resource "azurerm_virtual_network" "vnet01" {
  name                = "sgsvnet01"
  resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  dns_servers         = ["10.0.0.254", "10.0.0.253"]

    tags {
    environment = "${var.env_dev}"
  }
}
 
  resource "azurerm_subnet" "subnet01" {
  name                 = "sgssubnet01"
  resource_group_name  = "${azurerm_resource_group.SGS-PoC.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet01.name}"
  address_prefix       = "10.0.1.0/24"
  network_security_group_id = "${azurerm_network_security_group.sngular.id}"
}

  resource "azurerm_subnet" "subnetdb01" {
  name                 = "sgssubnetdb01"
  resource_group_name  = "${azurerm_resource_group.SGS-PoC.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet01.name}"
  address_prefix       = "10.0.2.0/24"
  network_security_group_id = "${azurerm_network_security_group.sngular.id}"
}
 

# create public IP
resource "azurerm_public_ip" "devpubips" {
    name = "devpubip"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
    public_ip_address_allocation = "dynamic"

    tags {
        environment = "${var.env_dev}"
    }
}

# create network interface
resource "azurerm_network_interface" "nic01" {
    name = "nic01"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"

    ip_configuration {
        name = "devconfiguration1"

        subnet_id = "${azurerm_subnet.subnet01.id}"
        private_ip_address_allocation = "static"
        private_ip_address = "10.0.2.5"
        public_ip_address_id = "${azurerm_public_ip.devpubips.id}"
    }
}

resource "azurerm_network_interface" "nic02" {
    name = "nic02"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"

    ip_configuration {
        name = "devconfiguration1"
        subnet_id = "${azurerm_subnet.subnet01.id}"
        private_ip_address_allocation = "static"
        private_ip_address = "10.0.2.10"
        public_ip_address_id = "${azurerm_public_ip.devpubips.id}"
    }
}