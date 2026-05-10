module "bastion" {
  source = "../../../modules/bastion"

  name                = "bastion-dev-roboshop"
  location            = data.terraform_remote_state.network.outputs.location
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["AzureBastionSubnet"]
}