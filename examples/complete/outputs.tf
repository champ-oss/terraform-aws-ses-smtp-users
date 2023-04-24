output "smtp_password_kms" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#ses_smtp_password_v4"
  value       = module.this.smtp_password_kms
}
