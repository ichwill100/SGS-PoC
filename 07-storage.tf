# create storage account
resource "azurerm_storage_account" "storage" {
    name = "sgspocstorage"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
    location = "${var.location}"
    account_tier = "Standard"
    account_replication_type = "LRS"

    #Locally redundant storage (LRS)
    #Zone-redundant storage (ZRS)
    #Geo-redundant storage (GRS)
    #Read-access geo-redundant storage (RA-GRS)

    tags {
        environment = "${var.env_dev}"
    }
}

# create storage container
resource "azurerm_storage_container" "storagecontainer" {
    name = "sgsvhdcontainer"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
    storage_account_name = "${azurerm_storage_account.storage.name}"
    container_access_type = "private"
    depends_on = ["azurerm_storage_account.storage"]
}