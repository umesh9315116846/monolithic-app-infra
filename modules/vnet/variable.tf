
variable "vnet_name" {

  type = map(object({
      name = string
      resource_group_name = string
      location = string
      address_space = optional(list(string))
  }))
}