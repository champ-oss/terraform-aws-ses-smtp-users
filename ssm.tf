resource "aws_ssm_parameter" "smtp_user" {
  name        = "ses-smtp-user-${random_string.identifier.result}"
  description = "smtp user password"
  type        = "SecureString"
  value       = aws_iam_access_key.smtp_user.ses_smtp_password_v4
  tags        = merge(local.tags, var.tags)
}