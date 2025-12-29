

rg_name = {
  rg = {
    name     = "test_rg_01"
    location = "norwayeast"
  }
}

vnet_name = {
  vnet = {
    name                = "test_vnet_002"
    location            = "norwayeast"
    resource_group_name = "test_rg_01"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet_name = {
  subnet = {
    name                 = "test_subnet_002"
    virtual_network_name = "test_vnet_002"
    resource_group_name  = "test_rg_01"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

pip_name = {
  pip1 = {
    name                = "test_pip_01"
    location            = "norwayeast"
    resource_group_name = "test_rg_01"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "test_pip_002"
    location            = "norwayeast"
    resource_group_name = "test_rg_01"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    vm_name              = "test-vm-01"
    nic_name             = "test_vm_01"
    location             = "norwayeast"
    resource_group_name  = "test_rg_01"
    virtual_network_name = "test_vnet_002"
    subnet_name          = "test_subnet_002"
    pip_name             = "test_pip_01"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

  }

  # vm2 = {
  #   vm_name              = "test-vm-03"
  #   nic_name             = "test_vm_02"
  #   location             = "norwayeast"
  #   resource_group_name  = "test_rg_01"
  #   virtual_network_name = "test_vnet_002"
  #   subnet_name          = "test_subnet_002"
  #   pip_name             = "test_pip_002"

  #   publisher = "Canonical"
  #   offer     = "0001-com-ubuntu-server-jammy"
  #   sku       = "22_04-lts"
  #   version   = "latest"

  # }
}

# mssql_name = {
#   sql1 = {

#     server_name                 = "dev-sql-server1991"
#     location                    = "norwayeast"
#     resource_group_name         = "test_rg_01"
#     version                     = "12.0"
#     administator_login          = "server123"
#     administator_login_password = "server@12345"
#     database_name               = "dev_sql_database1991"

#   }
# }