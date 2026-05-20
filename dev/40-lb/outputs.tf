output "public_appgw_backend_pool_id" {
  value = module.public_appgw.backend_pool_id
}

output "public_appgw_ip" {
  value = module.public_appgw.frontend_ip
}

output "internal_appgw_backend_pool_id" {
  value = module.internal_appgw.backend_pool_id
}

output "internal_appgw_ip" {
  value = module.internal_appgw.frontend_ip
}