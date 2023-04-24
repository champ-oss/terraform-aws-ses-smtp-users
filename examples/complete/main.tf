provider "aws" {
  alias  = "ses"
  region = "us-east-1"
}

module "this" {
  source            = "../../"
  enable_kms_output = true

  providers = {
    aws = aws.ses
  }
}
