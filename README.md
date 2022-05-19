# aws-rabbitmq
This is a Nullstone module to create a RabbitMQ cluster using Amazon MQ.
This module creates resources that are necessary to securely connect apps via Nullstone UI.

## Security & Compliance

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

[![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=INFRASTRUCTURE+SECURITY)
[![CIS AWS V1.3](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=CIS+AWS+V1.3)
[![PCI-DSS V3.2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=PCI-DSS+V3.2)
[![NIST-800-53](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=NIST-800-53)
[![ISO27001](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=ISO27001)
[![SOC2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=SOC2)
[![HIPAA](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-rabbitmq/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=nullstone-modules%2Faws-rabbitmq&benchmark=HIPAA)

## Inputs

- `engine_version: string`
  - Configure the engine version of RabbitMQ.
  - See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/rabbitmq-version-management.html

- `instance_type: string`
  - Configure the instance type of the RabbitMQ nodes.
  - Examples: mq.t3.micro, mq.m5.large
  - See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-instance-types.html

- `deployment_mode: string`
  - Configures how nodes are deployed in the RabbitMQ cluster.
  - Available options: SINGLE_INSTANCE, ACTIVE_STANDBY_MULTI_AZ, CLUSTER_MULTI_AZ

- `maintenance_window: object({ day_of_week : string, time_of_day : string )`
  - The day/time to perform maintenance on the cluster.
  - Specify day of week and time of day in the UTC time zone.
  - By default, set to { day_of_week = "MONDAY", time_of_day = "02:00" }.

## Outputs

- `db_master_secret_id: string` - ID of AWS Secrets Manager Secret that holds admin credentials
- `db_protocol: string` - Always set to `amqps` for `amqp` + `ssl`
- `db_endpoints: list(string)` - Endpoint URLs to access RabbitMQ
- `db_security_group_id: string` - Security Group ID for RabbitMQ
- `db_log_group: string` - Name of Cloudwatch Log Group for RabbitMQ logs
- `db_connection_log_group: string` - Name of Cloudwatch Log Group for RabbitMQ connection logs
