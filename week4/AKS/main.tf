# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "prefix" {}


#resource "azurerm_resource_group" "ODL-azure-1118427" {
 # name     = "${random_pet.prefix.id}-rg"
  #location = "Central India"

  
#}

resource "azurerm_kubernetes_cluster" "ODL-azure-1118427" {
  name                = "${random_pet.prefix.id}-aks"
  location            = "Central India"
  resource_group_name = "ODL-azure-1118427"
  dns_prefix          = "${random_pet.prefix.id}-k8s"
  kubernetes_version  = "1.26.3"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  
}