module "app_nsg" {
  source = "../../../terraform-azure-module/nsg"

  nsg_name            = "nsg-app-dev"
  location            = data.terraform_remote_state.network.outputs.location
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  rules               = var.app_nsg_rules
}

module "middleware_nsg" {
  source = "../../../terraform-azure-module/nsg"

  nsg_name            = "nsg-middleware-dev"
  location            = data.terraform_remote_state.network.outputs.location
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  rules               = var.middleware_nsg_rules
}

module "db_nsg" {

  source = "../../../terraform-azure-module/nsg"
  nsg_name            = "nsg-db-dev"
  location            = data.terraform_remote_state.network.outputs.location
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  rules               = var.db_nsg_rules
}

module "subnet_nsg_assoc" {
  source = "../../../terraform-azure-module/subnet-nsg-association"

  associations = {
    app = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      nsg_id    = module.app_nsg.nsg_id
    }

    middleware = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["middleware"]
      nsg_id    = module.middleware_nsg.nsg_id
    }

    db = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["db"]
      nsg_id    = module.db_nsg.nsg_id
    }
  }
}
