module "vmss" {

  source = "../../../terraform-azure-module/vmss"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  location = data.terraform_remote_state.network.outputs.location

  admin_username = var.admin_username

  ssh_public_key = file(var.ssh_public_key)

  backend_pool_map = {

    frontend = [
      data.terraform_remote_state.lb.outputs.public_appgw_backend_pool_id
    ]

    catalogue = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]

    user = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]

    cart = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]

    shipping = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]

    payment = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]

    dispatch = [
      data.terraform_remote_state.lb.outputs.internal_appgw_backend_pool_id
    ]
  }

  vmss_map = {

    frontend = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    catalogue = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    user = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    cart = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    shipping = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    payment = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }

    dispatch = {
      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]
      vm_size   = "Standard_D2s_v3"
      instances = 2
    }
  }

  tags = {
    Environment = "dev"
    Project     = "roboshop"
  }
}