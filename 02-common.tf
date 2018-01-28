resource "azurerm_resource_group" "SGS-PoC" {
 name     = "${var.resource_group_name}"
 location = "${var.location}"

 tags {
   environment = "${var.env_dev}"
 }
}