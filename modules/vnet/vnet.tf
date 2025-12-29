
resource "azurerm_virtual_network" "frnt_vnet" {
    for_each = var.vnet_name
name = each.value.name
location = each.value.location
resource_group_name = each.value.resource_group_name
address_space = each.value.address_space

}