output "smtp_username" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user#name"
  value       = var.enabled ? aws_iam_access_key.smtp_user[0].id : ""
}

# note: this will output to us-east-2 but isn't supported  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#encrypted_ses_smtp_password_v4
output "smtp_password" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#ses_smtp_password_v4"
  value       = var.enabled ? aws_iam_access_key.smtp_user[0].ses_smtp_password_v4 : ""
  sensitive   = true
}

output "smtp_password_kms" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key#ses_smtp_password_v4"
  value       = var.enable_kms_output && var.enabled ? aws_kms_ciphertext.this[0].ciphertext_blob : ""
}
