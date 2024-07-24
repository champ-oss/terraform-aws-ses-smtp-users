resource "aws_ssm_parameter" "smtp_password" {
  count       = var.enabled ? 1 : 0
  name        = var.name != "" ? "${var.name}-${random_string.identifier[0].result}" : "${var.git}-${random_string.identifier[0].result}"
  description = "smtp user password output for supported regions"
  type        = "SecureString"
  value       = aws_iam_access_key.smtp_user[0].ses_smtp_password_v4
  tags        = merge(local.tags, var.tags)
}
