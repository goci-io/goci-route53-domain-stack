locals {
  domain_parts  = split(".", var.domain_name)
  parent_domain = slice(local.domain_parts, 1, length(local.domain_parts)) 
}

module "zone" {
  source             = "git::https://github.com/goci-io/aws-route53-zone.git?ref=tags/0.5.0"
  namespace          = var.namespace
  stage              = var.stage
  attributes         = [var.region]
  domain_name        = var.domain_name
  parent_domain_name = local.parent_domain
}

module "external_dns" {
  source                       = "git::https://github.com/goci-io/aws-external-cluster-dns.git?ref=tags/0.1.0"
  namespace                    = var.namespace
  stage                        = var.stage
  region                       = var.region
  k8s_namespace                = var.k8s_namespace
  cluster_fqdn                 = var.domain_name
  domains                      = [var.domain_name]
  aws_region                   = var.aws_region
  create_iam_role              = false
  iam_attach_policy            = true
  iam_role_arn                 = var.iam_role_arn
  iam_role_external_id         = var.iam_role_external_id
  iam_role_trusted_arns        = [var.iam_role_trusted_arn]
}
