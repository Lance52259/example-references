################################################################
###  Authentication

variable "region" {
  description = "The region name"
}

variable "access_key" {
  description = "The access key for authentication"
}

variable "secret_key" {
  description = "The secret key for authentication"
}

variable "project_id" {
  description = "The ID of specified project (region)"
}

################################################################
###  Network

variable "network_name_prefix" {
  description = "The name prefix for all VPC resources within HUAWEI Cloud"

  type = string
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC resource within HUAWEI Cloud"

  type = string
}

################################################################
###  ECS

variable "worker_number" {
  description = "The total number of ECS instances within HUAWEI Cloud"

  type = number
}

variable "image_name" {
  description = "The image name for the IMS service within HUAWEI Cloud"

  type = string
}

variable "ecs_name_prefix" {
  description = "The name prefix for all ECS resources within HUAWEI Cloud"

  type = string
}
