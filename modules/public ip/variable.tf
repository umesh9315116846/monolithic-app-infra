
variable "pip_name" {
    type = map(object({
      name = string
      location = string
      resource_group_name = string
      allocation_method = optional(string)
    }))
}