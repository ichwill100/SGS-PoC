//Connection credentials to Azure API
variable "client_id" {
  description = "Client ID from Azure service principal"
  default = "a99898b2-d197-48a7-894b-0aaac7013674"
}
variable "client_secret" {
  description = "Client secret from Azure service principal"
  default = "un0wHcPXuni/e36nMq1Lc0U/+O/pH1lIdIIA+provGU="
}
variable "tenant_id" {
  description = "Tenant ID from Azure service principal"
  default = "118c6321-3ba8-43eb-90c0-ab3b86cdfec1"
}
variable "subscription_id" {
  description = "Subscription ID from Azure subscription"
  default = "a5690b16-a007-4e60-8a4d-2d67c6ed45da"
}

variable "env_dev" {
  description = "Environment name"
  default = "DEV"
}

//Common
variable "resource_group_name" {
  description = "Resource group name from Azure"
  default = "SGS-PoC"
}

#variable "resource_prefix_name" {
#  default = ""
#  description = "Prefix to add on each resource name"
#}

variable "location" {
  default = "West Europe"
  description = "Azure location"
}

//Rancher server

variable "srv_count" {
  default = "3"
  description = "Number of Rancher Server nodes"
}

#variable "rancher_sever_image_id" {
#  description = "Virtual Machine Image ID for Rancher server"
#}
#variable "rancher_server_name" {
#  default = "server" // Concatenated with ${var.resource_prefix_name}
#  description = "Rancher server name"
#}
#
// External domain
#variable "rancher_domain" {
#  description = "The rancher subdomain for the DNS zone"
#}
#
// DNS zone
#variable "rancher_dns_zone" {
#  description = "The rancher DNS zone"
#}
#
#variable "rancher_dns_zone_resource_group" {
#  description = "The resource group for the DNS zone"
#}
#
#variable "rancher_server_private_ip" {
#  default = "10.3.1.4"
#  description = "Rancher server private IP"
#}
#variable "rancher_server_vm_size" {
#  default = "Standard_DS1_v2"
#  description = "Rancher server VM size on Azure"
#}
#
//User
#variable "ssh_public_key_file_path" {
#  description = "Absolute path to public SSH key"
#}

#variable "ssh_private_key_file_path" {
#  description = "Absolute path to private SSH key"
#}

variable "rancher_username" {
  default = "rancher"
  description = "SSH username"
}

variable "rancher_password" {
  default = "rancher"
  description = "SSH password"
}

//Network
#variable "security_group_name" {
#  description = "Security group name on which to add security rules"
#}
#variable "subnet_id" {
#  description = "Subnet ID where to put Rancher server"
#}
#variable "vnet_address_space" {
#  description = "The address space that is used the virtual network"
#}

variable "Sngular_IPs" {
  description = "IPs Sngular."
  default     = ["80.26.158.242/32", "213.98.90.89/32", "54.194.0.11/32"]
}

//Database
variable "mysql_admin" {
  default = "rancher"
  description = "MySQL admin user"
}

variable "mysql_password" {
  default = "rancher"
  description = "MySQL admin pass"
}