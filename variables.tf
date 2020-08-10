variable "namespace" {
  type        = string
  description = "Organization or Company Prefix"
}

variable "stage" {
  type        = string
  default     = "ci"
  description = "Stage or Environment this Release is for"
}

variable "name" {
  type        = string
  description = "Name of your Stack. Applys to Release and Issuer Name"
}

variable "aws_region" {
  type        = string
  description = "AWS Region used for External DNS"
}

variable "region" {
  type        = string
  description = "Short Region Name used for Labeling and Naming"
}

variable "domain_name" {
  type        = string
  description = "Domain Name for External DNS to create Records in"
}

variable "iam_attach_policy" {
  type        = bool
  default     = true
  description = "When an existing Role is given via iam_role_arn we can attach required Policies for External DNS to work"
}

variable "iam_role_arn" {
  type        = string
  description = "IAM Role ARN to be used to attach External DNS Permissions to"
}

variable "iam_role_external_id" {
  type        = string
  default     = ""
  description = "External ID required to assume the External DNS Role"
}

variable "iam_role_trusted_arn" {
  type        = string
  description = "IAM ARN allowed to assume the External DNS Role"
}

variable "k8s_namespace" {
  type        = string
  default     = "default"
  description = "Namespace to deploy External DNS Release into"
}

variable "certificate_email" {
  type        = string
  description = "E-Mail used to send for example Expiry Notices to"
}

variable "aws_assume_role_arn" {
  type        = string
  default     = ""
  description = "Role to assume to create the Hosted Zone"
}

variable "aws_sts_external_id" {
  type        = string
  default     = ""
  description = "External-ID used to assume the Role to create the Hosted Zone"
}
