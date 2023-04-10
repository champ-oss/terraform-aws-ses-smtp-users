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

variable "enable_smtp_password" {
  description = "enable smtp password for non supported regions"
  type        = bool
  default     = false
}

variable "smtp_region" {
  description = "region to create smtp password for"
  type        = string
  default     = "us-east-1"
}
