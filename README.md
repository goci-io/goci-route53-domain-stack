# goci-route53-domain-stack

**Maintained by [@goci-io/prp-terraform](https://github.com/orgs/goci-io/teams/prp-terraform)**

![terraform](https://github.com/goci-io/goci-route53-domain-stack/workflows/terraform/badge.svg?branch=master&event=push)

[Install Stack on goci.io](https://goci.io/dashboard/providers/route53dns/wizard)

### Contains:
- External-DNS via Helm Release
- Optional IAM Role with and/or Role Policy Attachment
- Route53 Hosted Zone with optional delegated Access from a Root Domain
- Cert-Manager Issuer Resource for the newly created and scoped Root Domain
- Letsencrypt.org Account Registration using provided certificate_email

**Note:** This Module is intended to be used as "root module".

_This repository was created via [github-repository](https://github.com/goci-io/github-repository)._
