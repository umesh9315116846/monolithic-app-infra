
resource "azurerm_public_ip" "frnt_pip" {
    for_each = var.pip_name
 name = each.value.name
 location = each.value.location
 resource_group_name = each.value.resource_group_name
 allocation_method = each.value.allocation_method

}