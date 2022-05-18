output "db_admin_secret_name" {
  value       = aws_secretsmanager_secret.admin.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the admin credentials"
}

output "db_endpoints" {
  value       = [for instance in aws_mq_broker.this.instances : instance.endpoints[0]]
  description = "list(string) ||| The endpoint URLs to access the RabbitMQ instance. (Endpoint format: amqps://broker-id.mq.us-west-2.amazonaws.com:5671)"
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the RabbitMQ instance."
}

output "db_log_group" {
  value       = local.general_log_group_name
  description = "string ||| The name of the Cloudwatch Log Group where rabbitmq logs are emitted"
}

output "db_connection_log_group" {
  value       = local.connection_log_group_name
  description = "string ||| The name of the Cloudwatch Log Group where connection logs are emitted"
}
