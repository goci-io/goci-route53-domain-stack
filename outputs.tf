output "issuer_name" {
  value = var.namespace
}

output "domain_name" {
  value = var.domain_name
}

output "hosted_zone_id" {
  value = module.zone.zone_id
}
