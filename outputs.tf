output "db_admin_secret_name" {
  value       = aws_secretsmanager_secret.admin.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the admin credentials"
}

output "db_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the RabbitMQ instance."
}

output "db_log_group" {
  value       = aws_cloudwatch_log_group.general.name
  description = "string ||| The name of the Cloudwatch Log Group where rabbitmq logs are emitted"
}

output "db_connection_log_group" {
  value       = aws_cloudwatch_log_group.connection.name
  description = "string ||| The name of the Cloudwatch Log Group where connection logs are emitted"
}
