module "private_dns" {

  source = "../../../terraform-azure-module/private-dns"

  zone_name = "roboshop.internal"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  vnet_id = data.terraform_remote_state.network.outputs.vnet_id

  records = {

mongodb  = data.terraform_remote_state.data.outputs.private_ips["mongodb"]

mysql    = data.terraform_remote_state.data.outputs.private_ips["mysql"]

redis    = data.terraform_remote_state.data.outputs.private_ips["redis"]

rabbitmq = data.terraform_remote_state.data.outputs.private_ips["rabbitmq"]

catalogue = data.terraform_remote_state.appgw.outputs.public_appgw_ip
user      = data.terraform_remote_state.appgw.outputs.public_appgw_ip
cart      = data.terraform_remote_state.appgw.outputs.public_appgw_ip
shipping  = data.terraform_remote_state.appgw.outputs.public_appgw_ip
payment   = data.terraform_remote_state.appgw.outputs.public_appgw_ip
dispatch  = data.terraform_remote_state.appgw.outputs.public_appgw_ip
  }
}