variable "cluster_name" {
  description = "The name of the ECS Cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS Service"
  type        = string
}

variable "task_definition_family" {
  description = "The family name for the ECS Task Definition"
  type        = string
}

variable "container_name" {
  description = "The name of the container in the task definition"
  type        = string
}

variable "container_image" {
  description = "The container image to be used in the task definition"
  type        = string
}

variable "desired_count" {
  description = "The desired number of instances of the service"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "The subnet IDs for Fargate tasks"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The security group IDs to attach to Fargate tasks"
  type        = list(string)
}