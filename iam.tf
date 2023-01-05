data "aws_iam_policy_document" "smtp_user" {
  statement {
    actions = ["ses:SendRawEmail"]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user" "smtp_user" {
  name = "ses-smtp-user-${random_string.identifier.result}"
  tags = merge(local.tags, var.tags)
}

resource "aws_iam_access_key" "smtp_user" {
  user = aws_iam_user.smtp_user.name
}

resource "aws_iam_policy" "this" {
  name_prefix = "AmazonSesSendingAccess-"
  policy      = data.aws_iam_policy_document.smtp_user.json
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.smtp_user.name
  policy_arn = aws_iam_policy.this.arn
}
