resource "azurerm_network_interface" "nic" {
  for_each            = each.value.nic
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.linux_vm_private_ip
    public_ip_address_id          = each.value.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = each.value.linux_vm_name
  resource_group_name             = each.value.linux_vm_rgname
  location                        = each.value.linux_vm_location
  size                            = each.value.linux_vm_size
  admin_username                  = each.value.linux_vm_admin_username
  admin_password                  = each.value.linux_vm_admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.linux_vm_publisher
    offer     = each.value.linux_vm_offer
    sku       = each.value.linux_vm_sku
    version   = each.value.linux_vm_version
  }
}