locals {
  general_log_group_name    = "/aws/amazonmq/broker/${aws_mq_broker.this.id}/general"
  connection_log_group_name = "/aws/amazonmq/broker/${aws_mq_broker.this.id}/connection"
}

/*
NOTE: It would be preferable to encrypt the logs, attach tags, and set retention; however, it's not possible
      The log group name is determined by the broker id
      The id is random and is available *after* the broker is created
      This means that the log group will already exist by the time we try to create these log groups
      If there's ever a change to this resource to allow reusing existing resources, we can address this
resource "aws_cloudwatch_log_group" "general" {
  name              = local.general_log_group_name
  retention_in_days = 90
  kms_key_id        = aws_kms_key.this.arn
  tags              = local.tags
}

resource "aws_cloudwatch_log_group" "connection" {
  name              = local.connection_log_group_name
  retention_in_days = 90
  kms_key_id        = aws_kms_key.this.arn
  tags              = local.tags
}
*/
