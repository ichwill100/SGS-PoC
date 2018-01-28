#Create Database Instance
resource "azurerm_mysql_server" "mysql" {
  name                = "sgs-mysql-01"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"

  sku {
    name = "MYSQLB50"
    capacity = 50
    tier = "Basic"
  }

  administrator_login = "${var.mysql_admin}"
  administrator_login_password = "${var.mysql_password}"
  version = "5.7"
  storage_mb = "51200"
  ssl_enforcement = "Enabled"
}

resource "azurerm_mysql_configuration" "mysqlconfig" {
  name                = "interactive_timeout"
  resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
  server_name         = "${azurerm_mysql_server.mysql.name}"
  value               = "600"
}
# Enables the "Allow Access to Azure services" box as described in the API docs 
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_mysql_firewall_rule" "fw" {
  name                = "firewallrules"
  resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
  server_name         = "${azurerm_mysql_server.mysql.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}