resource "aws_cloudwatch_log_group" "general" {
  name              = "/aws/amazonmq/broker/${aws_mq_broker.this.id}/general"
  retention_in_days = 90
  kms_key_id        = aws_kms_key.this.arn
  tags              = local.tags
}

resource "aws_cloudwatch_log_group" "connection" {
  name              = "/aws/amazonmq/broker/${aws_mq_broker.this.id}/connection"
  retention_in_days = 90
  kms_key_id        = aws_kms_key.this.arn
  tags              = local.tags
}
