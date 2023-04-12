provider "aws" {
  alias  = "ses"
  region = "us-east-1"
}

module "this" {
  source = "../../"
  providers = {
    aws = aws.ses
  }
}