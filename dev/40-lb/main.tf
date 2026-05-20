module "public_appgw" {

  source = "../../../terraform-azure-module/appgw"

  name = "public-appgw-dev"

  location = data.terraform_remote_state.network.outputs.location

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["appgw"]

  is_public = true

  tags = {
    Environment = "dev"
    Project     = "roboshop"
  }
}

module "internal_appgw" {

  source = "../../../terraform-azure-module/appgw"

  name = "internal-appgw-dev"

  location = data.terraform_remote_state.network.outputs.location

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["appgw"]

  is_public = false

  private_ip = "10.0.10.10"

  tags = {
    Environment = "dev"
    Project     = "roboshop"
  }
}