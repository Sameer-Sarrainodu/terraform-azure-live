output "frontend_backend_pool_id" {

  value = module.public_appgw.frontend_backend_pool_id
}

output "frontend_ip" {

  value = module.public_appgw.frontend_ip
}

output "probe_ids" {

  value = module.public_appgw.probe_ids
}