module "vm" {
  source = "../../../terraform-azure-module/vm"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.location

  admin_username      = var.admin_username
  ssh_public_key      = file("~/.ssh/roboshop-azure.pub")

  vm_map = {
    mongodb = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["db"]
      size      = "Standard_B2s"
    }

    mysql = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["db"]
      size      = "Standard_B2s"
    }

    redis = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["middleware"]
      size      = "Standard_B2s"
    }

    rabbitmq = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["middleware"]
      size      = "Standard_B2s"
    }
  }
}