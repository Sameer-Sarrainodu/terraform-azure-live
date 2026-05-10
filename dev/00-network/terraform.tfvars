rg_name  = "rg-dev-roboshop"
location = "Central India"

tags = {
  env     = "dev"
  project = "roboshop"
}
vnet_name = "vnet-dev-roboshop"
vnet_cidr = "10.0.0.0/16"

subnets = {
  app = {
    cidr = "10.0.1.0/24"
  }
  middleware = {
    cidr = "10.0.2.0/24"
  }
  db = {
    cidr = "10.0.3.0/24"
  }
  AzureBastionSubnet = {
    cidr = "10.0.4.0/27"
  }
  appgw = { 
    cidr = "10.0.5.0/24"

  }
}