module "public_appgw" {

  source = "../../../terraform-azure-module/application-gateway"

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
