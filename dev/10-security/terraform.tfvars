app_nsg_rules = [

  {
    name                       = "allow-appgw-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.5.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "80"
  },

  {
    name                       = "allow-appgw-apps"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.5.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "8080"
  },

  {
    name                       = "allow-azure-lb-http"
    priority                   = 115
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
    destination_port_range     = "80"
  },

  {
    name                       = "allow-azure-lb-apps"
    priority                   = 116
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
    destination_port_range     = "8080"
  },

  {
    name                       = "allow-ssh"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }
]

middleware_nsg_rules = [

  {
    name                       = "allow-ssh"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  },

  {
    name                       = "allow-redis"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "6379"
  },

  {
    name                       = "allow-rabbitmq"
    priority                   = 140
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
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  },

  {
    name                       = "allow-mysql"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "3306"
  },

  {
    name                       = "allow-mongodb"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
    destination_port_range     = "27017"
  }

]