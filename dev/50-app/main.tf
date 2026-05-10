module "vmss" {
  source = "../../../terraform-azure-module/vmss"

  name                = "vmss-dev-roboshop"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.location

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

  admin_username = var.admin_username
  ssh_public_key = file("~/.ssh/roboshop-azure.pub")

  instance_count = 2

  backend_pool_ids = [
    data.terraform_remote_state.appgw.outputs.backend_pool_id
  ]

  tags = {
    env = "dev"
  }
}