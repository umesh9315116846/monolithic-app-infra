data "azurerm_public_ip" "frnt_pip" {
 name = var.pip_name
 resource_group_name = var.resource_group_name
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "LB-Frontend"
    public_ip_address_id = data.azurerm_public_ip.frnt_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bpool" {
  name = var.pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lbprobe" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Http"
  port                = 80
}

resource "azurerm_lb_rule" "lbrule" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LB-Frontend"
  probe_id                       = azurerm_lb_probe.lbrule.id
}

data "azurerm_network_interface" "frnt_nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend" {

  network_interface_id      = data.azurerm_network_interface.frnt_nic.id
  ip_configuration_name     = "internal"
  backend_address_pool_id   = azurerm_lb_backend_address_pool.bpool.id
}