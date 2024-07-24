moved {
  from = data.aws_iam_user_policy_attachment.smtp_user
  to   = data.aws_iam_user_policy_attachment.smtp_user[0]
}

moved {
  from = aws_iam_user.smtp_user
  to   = aws_iam_user.smtp_user[0]
}

moved {
  from = aws_iam_user_policy_attachment.this
  to   = aws_iam_user_policy_attachment.this[0]
}

moved {
  from = aws_iam_access_key.smtp_user
  to   = aws_iam_access_key.smtp_user[0]
}

moved {
  from = aws_iam_policy.this
  to   = aws_iam_policy.this[0]
}

moved {
  from = random_string.identifier
  to   = random_string.identifier[0]
}

moved {
  from = aws_ssm_parameter.smtp_password
  to   = aws_ssm_parameter.smtp_password[0]
}
