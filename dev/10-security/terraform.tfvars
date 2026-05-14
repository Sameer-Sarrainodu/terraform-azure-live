app_nsg_rules = [

  {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
  },

  {
    name                       = "allow-ssh"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  },

  {
    name                       = "allow-jenkins"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    destination_port_range     = "8080"
  }

]

middleware_nsg_rules = [

  {
    name                       = "allow-ssh"
    priority                   = 90
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  },

  {
    name                       = "allow-redis"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "6379"
  },

  {
    name                       = "allow-rabbitmq"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "5672"
  }

]

db_nsg_rules = [

  {
    name                       = "allow-ssh"
    priority                   = 90
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  },

  {
    name                       = "allow-mysql"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "3306"
  },

  {
    name                       = "allow-mongodb"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "27017"
  }

]