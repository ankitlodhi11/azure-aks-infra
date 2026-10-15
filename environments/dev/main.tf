
module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source   = "../../modules/networking"
  for_each = var.vnets

  name               = each.value.name
  resource_group_name = module.resource_group[
    each.value.resource_group_key
  ].name

  location      = var.location
  address_space = each.value.address_space
  subnets       = each.value.subnets
  tags          = var.tags
}

module "acr" {
  source   = "../../modules/acr"
  for_each = var.acrs

  name = each.value.name

  resource_group_name = module.resource_group[
    each.value.resource_group_key
  ].name

  location = var.location
  tags     = var.tags
}

module "aks" {
  source   = "../../modules/aks"
  for_each = var.aks_clusters

  name       = each.value.name
  dns_prefix = each.value.dns_prefix

  resource_group_name = module.resource_group[
    each.value.resource_group_key
  ].name

  location = var.location

  subnet_id = module.networking[
    each.value.vnet_key
  ].subnet_ids[each.value.subnet_key]

  acr_id = module.acr[
    each.value.acr_key
  ].id

  node_count = each.value.node_count
  vm_size    = each.value.vm_size
  tags       = var.tags
}
