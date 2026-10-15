
location = "Central India"

resource_groups = {
  app = {
    name = "rg-aks-dev-001"
  }
}

vnets = {
  app = {
    name               = "vnet-aks-dev-001"
    resource_group_key = "app"
    address_space      = ["10.20.0.0/16"]

    subnets = {
      aks = {
        name             = "snet-aks"
        address_prefixes = ["10.20.1.0/24"]
      }
    }
  }
}

acrs = {
  app = {
    name               = "aksdevregistry123456"
    resource_group_key = "app"
  }
}

aks_clusters = {
  dev = {
    name               = "aks-dev-001"
    dns_prefix         = "aks-dev-001"
    resource_group_key = "app"
    vnet_key           = "app"
    subnet_key         = "aks"
    acr_key            = "app"
    node_count         = 1
    vm_size            = "Standard_D2s_v3"
  }
}
