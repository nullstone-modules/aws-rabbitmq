locals {
  admin_username = replace(data.ns_workspace.this.block_ref, "-", "_")
}

// RabbitMQ password value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~).
//   This value must be 2-100 characters long.
resource "random_password" "admin" {
  // Master password length constraints differ for each database engine. For more information, see the available settings when creating each DB instance.
  length           = 16
  special          = true
  override_special = "-._~"
}

resource "aws_secretsmanager_secret" "admin" {
  name       = "${local.resource_name}/admin"
  tags       = local.tags
  kms_key_id = aws_kms_key.this.id
}

resource "aws_secretsmanager_secret_version" "admin" {
  secret_id     = aws_secretsmanager_secret.admin.id
  secret_string = jsonencode(tomap({ "username" = local.admin_username, "password" = random_password.admin.result }))
}
