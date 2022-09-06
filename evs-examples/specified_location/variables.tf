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
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC resource within HUAWEI Cloud"
  default     = "172.16.0.0/16"
}

################################################################
###  EVS

variable "volume_configuration" {
  description = "The name prefix for all ECS resources within HUAWEI Cloud"

  type = map(object({
    location = string
    type     = string
    size     = number
  }))
}

variable "evs_name_prefix" {
  description = "The name prefix for all ECS resources within HUAWEI Cloud"

  type = string
}

################################################################
###  ECS

variable "image_name" {
  description = "The image name for the IMS service within HUAWEI Cloud"

  type = string
}

variable "ecs_name_prefix" {
  description = "The name prefix for all ECS resources within HUAWEI Cloud"

  type = string
}
