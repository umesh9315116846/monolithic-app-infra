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