output "rg_name" {
  value = module.rg.name
}

output "location" {
  value = module.rg.location
}
output "subnet_ids" {
  value = module.vnet.subnet_ids
}