variable "rg_name" {
    type = map(object({
      name = string
      location = string
      tags  = optional(map(string))
    }))
}



variable "vnet_name" {

  type = map(object({
      name = string
      resource_group_name = string
      location = string
      address_space = optional(list(string))
  }))
}



variable "subnet_name" {
    type = map(object({
      name = string
      virtual_network_name = string
      resource_group_name = string
      address_prefixes  = optional(list(string)) 
    }))

}



variable "pip_name" {
    type = map(object({
      name = string
      location = string
      resource_group_name = string
      allocation_method = optional(string)
    }))
}

variable "vms" {
type = map(object({
  
    vm_name              = string
    nic_name             = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    pip_name             = string

     
    publisher            = string
    offer                = string 
    sku                  = string
    version              = string
    
}))
 }

# variable "mssql_name" {}