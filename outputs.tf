output "db_admin_secret_name" {
  value       = aws_secretsmanager_secret.admin.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the admin credentials"
}
