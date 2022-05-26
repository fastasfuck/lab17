variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24",
    "10.0.33.0/24"
  ]
}
variable "ecs_cluster_name" {
  default = "test"
}
variable "task_name" {
  default = "worker"
}
variable "bucket_name" {
  default = "fastptumfast"
}
variable "bucket_name2" {
  default = "fastptumfast1442"
}
