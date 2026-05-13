module "vm" {
  source = "../../../terraform-azure-module/vm"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.location

  admin_username      = var.admin_username
  ssh_public_key      = file(var.ssh_public_key)

  vm_map = {
    mongodb = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["db"]
      size      = "Standard_D2s_v3"
    }

    mysql = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["db"]
      size      = "Standard_D2s_v3"
    }

    redis = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["middleware"]
      size      = "Standard_D2s_v3"
    }

    rabbitmq = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["middleware"]
      size      = "Standard_D2s_v3"
    }
  }
}