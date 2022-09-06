variable "az_names" {
  description = "The name list of availability zone the Huaweicloud VPC"

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

variable "volume_configuration" {
  description = "The configuration list of EVS volumes within HUAWEI Cloud"

  type = map(object({
    location = string
    type     = string
    size     = number
  }))
}

variable "volume_resources" {
  description = "The list of EVS volume resources within HUAWEI Cloud"

  type = map(object({
    id = string
  }))
}
