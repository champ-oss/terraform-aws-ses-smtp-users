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