output "smtp_username" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  value       = aws_iam_user.smtp_user.name
}