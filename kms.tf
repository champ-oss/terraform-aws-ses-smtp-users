# Only used to KMS encrypt the output values
module "kms" {
  count           = var.enable_kms_output ? 1 : 0
  source          = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.34-a5b529e"
  enabled         = var.enabled ? true : false
  git             = var.git
  name            = "alias/${var.git}-${random_string.identifier[0].result}"
  account_actions = []
  tags            = merge(local.tags, var.tags)
}

resource "aws_kms_ciphertext" "this" {
  count     = var.enable_kms_output && var.enabled ? 1 : 0
  key_id    = module.kms[0].key_id
  plaintext = aws_iam_access_key.smtp_user[0].ses_smtp_password_v4
}
