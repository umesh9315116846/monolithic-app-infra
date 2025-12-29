
resource "azurerm_resource_group" "frnt_rg" {
    for_each = var.rg_name
    name = each.value.name
    location = each.value.location
    tags = lookup(each.value, "tags", null)
} 