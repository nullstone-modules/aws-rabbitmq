locals {
  deployment_mode = upper(var.deployment_mode)
  subnet_ids      = local.deployment_mode == "SINGLE_INSTANCE" ? try([local.private_subnet_ids[0]], []) : local.private_subnet_ids
}

resource "aws_mq_broker" "this" {
  #bridgecrew:skip=CKV_AWS_209: Skipping "Ensuring MQ broker encrypted". Encryption is not supported when engine_type="RabbitMQ"
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

  logs {
    general = true
  }

  // NOTE: "encryptionOptions is not supported for RabbitMQ brokers"
  // encryption_options {}

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
