resource "null_resource" "smtp_password" {
  count = var.enable_smtp_password_create ? 1 : 0
  triggers = {
    smtp_secret = aws_iam_access_key.smtp_user.secret
  }
  provisioner "local-exec" {
    command     = "chmod +x ${path.module}/smtp_password.py;python ${path.module}/smtp_password.py ${aws_iam_access_key.smtp_user.secret} ${var.smtp_region} >> ${path.module}/smtp_password_output.txt"
    interpreter = ["bash", "-c"]
  }
}

data "local_file" "smtp_password_output" {
  count      = var.enable_smtp_password_create ? 1 : 0
  filename   = "${path.module}/smtp_password_output.txt"
  depends_on = ["null_resource.smtp_password"]
}

resource "aws_ssm_parameter" "smtp_password" {
  name        = "ses-smtp-user-${random_string.identifier.result}"
  description = "smtp user password for non supported region"
  type        = "SecureString"
  value       = var.enable_smtp_password_create ? data.local_file.smtp_password_output[0].content : aws_iam_access_key.smtp_user.ses_smtp_password_v4
  tags        = merge(local.tags, var.tags)
}
