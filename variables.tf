locals {
  tags = {
    cost    = "shared"
    creator = "terraform"
    git     = var.git
  }
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-ses-smtp-users"
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  type        = string
  default     = ""
}

variable "enable_kms_output" {
  description = "Enable KMS encryption of output values"
  type        = bool
  default     = false
}
