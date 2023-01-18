output "smtp_key" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  value       = aws_iam_access_key.smtp_user.id
}

output "smtp_secret" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#ses_smtp_password_v4"
  value       = aws_iam_access_key.smtp_user.secret
  sensitive   = true
}
