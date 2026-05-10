module "rg" {
  source = "../../../terraform-azure-module/resourcegroup"

  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "vnet" {

  source = "../../../terraform-azure-module/vnet"

  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.rg.name
  vnet_cidr           = var.vnet_cidr
  subnets             = var.subnets
  tags                = var.tags
}

module "nat" {
  source = "../../../terraform-azure-module/nat-gateway"

  name                = "nat-dev-roboshop"
  location            = var.location
  resource_group_name = module.rg.name

  subnet_ids = {
    app        = module.vnet.subnet_ids["app"]
    middleware = module.vnet.subnet_ids["middleware"]
    db         = module.vnet.subnet_ids["db"]
  }

  tags = var.tags
}