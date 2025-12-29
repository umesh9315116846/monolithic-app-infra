
resource "azurerm_mssql_server" "dev_server" {
    for_each  = var.mssql_name
    name                  = each.value.server_name
    location              = each.value.location
    resource_group_name   = each.value.resource_group_name
    version                      = each.value.version
    administrator_login           = each.value.administator_login
    administrator_login_password  = each.value.administator_login_password



}

resource "azurerm_mssql_database" "dev_database"  {

    for_each  =  var.mssql_name
    name                = each.value.database_name
    server_id           = azurerm_mssql_server.dev_server[each.key].id

}