module "private_dns" {
  source = "../../../terraform-azure-module/private-dns"

  zone_name           = "roboshop.internal"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  vnet_id             = data.terraform_remote_state.network.outputs.vnet_id

  records = {
    mongodb  = "10.0.3.4"
    mysql    = "10.0.3.5"
    redis    = "10.0.2.4"
    rabbitmq = "10.0.2.5"
  }
}