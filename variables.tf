variable "engine_version" {
  type        = string
  default     = "3.9.13"
  description = <<EOF
Configure the engine version of RabbitMQ.
See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/rabbitmq-version-management.html
EOF
}

variable "instance_type" {
  type        = string
  default     = "mq.t3.micro"
  description = <<EOF
Configure the instance type of the RabbitMQ nodes.
Examples: mq.t3.micro, mq.m5.large
See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-instance-types.html
EOF
}

variable "deployment_mode" {
  type        = string
  default     = "SINGLE_INSTANCE"
  description = <<EOF
Configures how nodes are deployed in the RabbitMQ cluster.
Available options: SINGLE_INSTANCE, ACTIVE_STANDBY_MULTI_AZ, CLUSTER_MULTI_AZ
EOF
}

variable "maintenance_window" {
  type = object({
    day_of_week : string
    time_of_day : string
  })

  default = {
    day_of_week = "MONDAY"
    time_of_day = "02:00"
  }

  description = <<EOF
The day/time to perform maintenance on the cluster.
Specify day of week and time of day in the UTC time zone.
By default, set to { day_of_week = "MONDAY", time_of_day = "02:00" }.
EOF
}

locals {
  port = 5671
}
