output "smtp_username" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  value       = aws_iam_access_key.smtp_user.id
}

output "smtp_password" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#ses_smtp_password_v4"
  value       = aws_iam_access_key.smtp_user.ses_smtp_password_v4
  sensitive   = true
}
