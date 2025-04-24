create_resource_group = true

resource_group_name = "testing_modular_rg"

location = "eastus2"

vnets = {
  testing-service-vnet = {
    name          = "testing-service-vnet"
    address_space = ["10.10.0.0/16"]
  }
  testing-sharedservice-vnet = {
    name          = "testing-sharedservice-vnet"
    address_space = ["10.20.0.0/16"]
  }
}

subnets = {
  testing-service-subnet = {
    name            = "testing-service-subnet"
    vnet_name       = "testing-service-vnet"
    address_prefixes = ["10.10.1.0/24"]
  }
  testing-sharedservice-subnet = {
    name            = "testing-sharedservice-subnet"
    vnet_name       = "testing-sharedservice-vnet"
    address_prefixes = ["10.20.1.0/24"]
  }
}

nsgs = {
  testing-service-nsg = {
    name = "testing-service-nsg"
  }
  testing-sharedservice-nsg = {
    name = "testing-sharedservice-nsg"
  }
}

nsg_rules = {
    testing-service-allow-http = {
      name                       = "Allow_HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      nsg_key                    = "testing-service-nsg"
    }
    testing-sharedservice-allow-rdp = {
      name                       = "Allow_RDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      nsg_key                    = "testing-sharedservice-nsg"
    }
  }

  nsg_associations = {
    testing-service-nsg-assoc = {
      subnet_key = "testing-service-subnet"
      nsg_key    = "testing-service-nsg"
    }
    testing-sharedservice-nsg-assoc = {
      subnet_key = "testing-sharedservice-subnet"
      nsg_key    = "testing-sharedservice-nsg"
    }
  }