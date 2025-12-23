resource_groups = {
  "rg1" = {
    rg_name     = "rg-todo-gen-dev-01"
    rg_location = "japaneast"
  }
}

nsg = {
  nsg1 = {
    nsg_name     = "todo-gen-dev-nsg1"
    nsg_location = "japaneast"
    nsg_rg_name  = "rg-todo-gen-dev-01"
  }
}

nsg_rules = [
  {
    name                   = "Allow-HTTP"
    priority               = 100
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    destination_port_range = "80"
  },
  {
    name                   = "Allow-HTTPS"
    priority               = 110
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    destination_port_range = "443"
  },
  {
    name                   = "Allow-DB-443"
    priority               = 120
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    destination_port_range = "443"
  }
]


vnets = {
  vnet1 = {
    vnet_name     = "todo-genvnet"
    location      = "japaneast"
    vnet_rg_name  = "rg-todo-gen-dev-01"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  frontend = {
    subnet_name      = "frontend_subnet"
    subnet_rg        = "rg-todo-gen-dev-01"
    subnet_vnet_name = "todo-genvnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  backend = {
    subnet_name      = "backend_subnet"
    subnet_rg        = "rg-todo-gen-dev-01"
    subnet_vnet_name = "todo-genvnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

nsg_subnet_association = {
  nsg1 = "frontend"
  nsg1 = "backend"
}

linux_vms = {
  frontend = {
    vm_name             = "todo-gen-frontend-vm"
    resource_group_name = "rg-todo-gen-dev-01"
    location            = "japaneast"
    size                = "Standard_D2s_v3"
    admin_username      = "azureuser"
    admin_password      = "Password@123"

    subnet_key = "frontend"
    private_ip = "10.0.1.10"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  backend = {
    vm_name             = "todo-gen-backend-vm"
    resource_group_name = "rg-todo-gen-dev-01"
    location            = "japaneast"
    size                = "Standard_D2s_v3"
    admin_username      = "azureuser"
    admin_password      = "Password@123"

    subnet_key = "backend"
    private_ip = "10.0.2.10"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

public_ip = {
  frontend = {
    pip_name              = "frontend-pip"
    pip_rgname            = "rg-todo-gen-dev-01"
    pip_location          = "japaneast"
    pip_allocation_method = "Static"
  }

  backend = {
    pip_name              = "backend-pip"
    pip_rgname            = "rg-todo-gen-dev-01"
    pip_location          = "japaneast"
    pip_allocation_method = "Static"
  }
}

sqlserver = {
  dev = {
    sqlserver_name     = "dev-sql"
    sql_rg_name        = "rg-dev"
    sqlserver_location = "japaneast"
    sqlserver_version  = "12.0"
    sql_admin_userid   = "admin"
    sql_admin_password = "Password@123"
  }
}

sqldb = {
  appdb = {
    sqldb_name = "todo-db"
    server_key = "dev"
  }
}
