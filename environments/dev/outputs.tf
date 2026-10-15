
output "resource_group_names" {
  value = {
    for key, rg in module.resource_group :
    key => rg.name
  }
}

output "vnet_ids" {
  value = {
    for key, network in module.networking :
    key => network.vnet_id
  }
}

output "subnet_ids" {
  value = {
    for key, network in module.networking :
    key => network.subnet_ids
  }
}

output "acr_names" {
  value = {
    for key, registry in module.acr :
    key => registry.name
  }
}

output "acr_login_servers" {
  value = {
    for key, registry in module.acr :
    key => registry.login_server
  }
}

output "aks_names" {
  value = {
    for key, cluster in module.aks :
    key => cluster.name
  }
}
