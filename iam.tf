# required policy action for smtp user
data "aws_iam_policy_document" "smtp_user" {
  count = var.enabled ? 1 : 0
  statement {
    actions = ["ses:SendRawEmail"]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user" "smtp_user" {
  count = var.enabled ? 1 : 0
  name  = var.name != "" ? var.name : "${var.git}-${random_string.identifier[0].result}"
  tags  = merge(local.tags, var.tags)
}

resource "aws_iam_access_key" "smtp_user" {
  count = var.enabled ? 1 : 0
  user  = aws_iam_user.smtp_user[0].name
}

resource "aws_iam_policy" "this" {
  count  = var.enabled ? 1 : 0
  name   = var.policy_name != "" ? var.policy_name : "${var.git}-${random_string.identifier[0].result}"
  policy = data.aws_iam_policy_document.smtp_user[0].json
}

resource "aws_iam_user_policy_attachment" "this" {
  count      = var.enabled ? 1 : 0
  user       = aws_iam_user.smtp_user[0].name
  policy_arn = aws_iam_policy.this[0].arn
}
