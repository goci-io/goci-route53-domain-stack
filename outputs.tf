output "issuer_name" {
  value = var.name
}

output "domain_name" {
  value = module.zone.domain_name
}

output "hosted_zone_id" {
  value = module.zone.zone_id
}
