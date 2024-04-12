terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

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
