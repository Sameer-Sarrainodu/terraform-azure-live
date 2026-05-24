output "private_ip" {

  value = module.internal_appgw.private_ip
}

output "backend_pool_ids" {

  value = module.internal_appgw.backend_pool_ids
}