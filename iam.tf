data "aws_iam_policy" "this" {
  arn = "arn:aws:iam::aws:policy/AmazonSesSendingAccess"
}

resource "aws_iam_user" "smtp_user" {
  name = "ses-smtp-user-${random_string.identifier.result}"
  tags = merge(local.tags, var.tags)
}

resource "aws_iam_access_key" "smtp_user" {
  user = aws_iam_user.smtp_user.name
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.smtp_user.name
  policy_arn = data.aws_iam_policy.this.arn
}
