locals {
  deployment_mode = upper(var.deployment_mode)
  subnet_ids      = local.deployment_mode == "SINGLE_INSTANCE" ? try([local.private_subnet_ids[0]], []) : local.private_subnet_ids
}

resource "aws_mq_broker" "this" {
  broker_name                = local.resource_name
  deployment_mode            = local.deployment_mode
  engine_type                = "RabbitMQ"
  engine_version             = var.engine_version
  host_instance_type         = var.instance_type
  auto_minor_version_upgrade = true
  apply_immediately          = true
  publicly_accessible        = false
  subnet_ids                 = local.subnet_ids
  security_groups            = [aws_security_group.this.id]
  authentication_strategy    = "simple"
  tags                       = local.tags

  encryption_options {
    kms_key_id        = aws_kms_key.this.arn
    use_aws_owned_key = false
  }

  logs {
    general = true
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_window.day_of_week
    time_of_day = var.maintenance_window.time_of_day
    time_zone   = "UTC"
  }

  user {
    username = local.admin_username
    password = random_password.admin.result
  }
}
