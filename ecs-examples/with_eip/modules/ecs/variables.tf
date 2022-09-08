variable "worker_number" {
  description = "The total number of ECS instances within HUAWEI Cloud"

  type = number
}

variable "az_names" {
  description = "The name list of availability zone within HUAWEI Cloud"

  type = list(string)
}

variable "image_name" {
  description = "The image name for the IMS service within HUAWEI Cloud"

  type = string
}

variable "name_prefix" {
  description = "The name prefix for ECS resources within HUAWEI Cloud"

  type = string
}

variable "network_id" {
  description = "The network ID of subnet resource within HUAWEI Cloud"

  type = string
}

variable "security_group_id" {
  description = "The security group ID for the VPC service within HUAWEI Cloud"

  type = string
}

variable "eip_id" {
  description = "The ID of EIP resource within HUAWEI Cloud"

  type = string
}
