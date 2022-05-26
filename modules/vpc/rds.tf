
resource "aws_ecs_cluster" "foo" {
  name = var.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_service" "worker" {
  name            = var.task_name
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  network_configuration {
      subnets          = aws_subnet.public_subnets[*].id
      assign_public_ip = false
    #  security_groups = [aws_security_group.ecs_sg.id]
    }
}


resource "aws_ecs_task_definition" "task_definition" {
  family                = var.task_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([
    {
      "name": "worker"
      "image": "nginx:latest",
      "environment": [],
      "entryPoint": [],
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
          loadBalancerName: "my-alb"
        }
      ],
      "networkMode": "awsvpc"
    }
  ])
}
