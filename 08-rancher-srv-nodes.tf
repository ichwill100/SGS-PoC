# create virtual machine
resource "azurerm_virtual_machine" "ranchersrvnode" {
    name = "rancher-srv-node01"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.SGS-PoC.name}"
    network_interface_ids = ["${azurerm_network_interface.nic01.id}"]
    vm_size = "Standard_A0"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04.0-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "ranchersrvnode01disk01"
        vhd_uri = "${azurerm_storage_account.storage.primary_blob_endpoint}${azurerm_storage_container.storagecontainer.name}/ranchersrvdisk01.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "rancher-srv-node01"
        admin_username = "${var.rancher_username}"
        admin_password = "${var.rancher_password}"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    tags {
        environment = "${var.env_dev}"
    }
}