module "acme" {
  source            = "git::https://github.com/goci-io/letsencrypt-account.git?ref=tags/0.1.0"
  certificate_email = var.certificate_email
}

resource "null_resource" "apply_issuer" {
  provisioner "local-exec" {
    command = "echo \"${self.triggers.issuer}\" | kubectl apply -n ${self.triggers.k8s_namespace} -f -"
  }

  triggers = {
    k8s_namespace = var.k8s_namespace
    issuer = templatefile("${path.module}/cert-issuer.yaml", {
      private_key_secret = module.acme.account_key_pem
      hosted_zone_id     = module.zone.zone_id
      email              = var.certificate_email
      aws_region         = var.aws_region
      name               = var.name
    })
  }
}

resource "null_resource" "delete_issuer" {
  provisioner "local-exec" {
    when    = destroy
    command = "kubectl delete -n ${self.triggers.k8s_namespace} issuer ${self.triggers.name} --ignore-not-found"
  }

  triggers = {
    name          = var.name
    k8s_namespace = var.k8s_namespace
  }
}
