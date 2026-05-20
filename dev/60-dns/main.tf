module "private_dns" {

  source = "../../../terraform-azure-module/private-dns"

  zone_name = "roboshop.internal"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  vnet_id = data.terraform_remote_state.network.outputs.vnet_id

  records = {

    mongodb  = "10.0.3.4"
    mysql    = "10.0.3.5"
    redis    = "10.0.2.4"
    rabbitmq = "10.0.2.5"

    catalogue = data.terraform_remote_state.lb.outputs.internal_appgw_ip
    user      = data.terraform_remote_state.lb.outputs.internal_appgw_ip
    cart      = data.terraform_remote_state.lb.outputs.internal_appgw_ip
    shipping  = data.terraform_remote_state.lb.outputs.internal_appgw_ip
    payment   = data.terraform_remote_state.lb.outputs.internal_appgw_ip
    dispatch  = data.terraform_remote_state.lb.outputs.internal_appgw_ip
  }
}