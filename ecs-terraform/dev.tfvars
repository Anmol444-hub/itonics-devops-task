  cluster_name           = "ecs-php-cluster"
  service_name           = "ecs-php-service"
  task_definition_family = "ecs-php-task-definition"
  container_name         = "ecs-php-container"
  container_image        = "ecs-php-container-image:latest"
  subnet_ids             = ["subnet-0a3e5c98"]
  security_group_ids     = ["sg-047b1f98"]
  desired_count          = 2