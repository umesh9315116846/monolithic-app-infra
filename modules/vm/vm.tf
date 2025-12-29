data "azurerm_subnet" "frnt_subnet" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "frnt_pip" {

   for_each = var.vms
   name = each.value.pip_name
  resource_group_name = each.value.resource_group_name

}

 resource "azurerm_network_interface" "frnt_nic" {
  for_each = var.vms
  name = each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  

 ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.frnt_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.frnt_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
 }
 

 resource "azurerm_linux_virtual_machine" "frnt_vm" {
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = "Standard_B1s"
  admin_username = "Umesh123"
  admin_password = "Umesh@12345"
disable_password_authentication = false
 network_interface_ids = [azurerm_network_interface.frnt_nic[each.key].id]
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
   publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
 }
}