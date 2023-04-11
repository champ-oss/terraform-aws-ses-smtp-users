provider "aws" {
  region = "us-east-2"
}

module "this" {
  source                      = "../../"
  enable_smtp_password_create = true
}