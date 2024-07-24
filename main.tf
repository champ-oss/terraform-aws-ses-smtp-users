resource "random_string" "identifier" {
  count   = var.enabled ? 1 : 0
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}
