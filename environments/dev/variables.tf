
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)

  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "azure-aks-infra"
  }
}

variable "resource_groups" {
  type = map(object({
    name = string
  }))
}

variable "vnets" {
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)

    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "acrs" {
  type = map(object({
    name               = string
    resource_group_key = string
  }))
}

variable "aks_clusters" {
  type = map(object({
    name               = string
    dns_prefix         = string
    resource_group_key = string
    vnet_key           = string
    subnet_key         = string
    acr_key            = string
    node_count         = number
    vm_size            = string
  }))
}
