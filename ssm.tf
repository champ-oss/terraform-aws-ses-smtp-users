resource "aws_ssm_parameter" "smtp_password" {
  name        = var.name != "" ? "${var.name}-${random_string.identifier.result}" : "${var.git}-${random_string.identifier.result}"
  description = "smtp user password output for supported regions"
  type        = "SecureString"
  value       = aws_iam_access_key.smtp_user.ses_smtp_password_v4
  tags        = merge(local.tags, var.tags)
}
