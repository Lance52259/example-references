variable "name_prefix" {
  description = "The prefix name for RDS resources within HUAWEI Cloud"
}

variable "vpc_id" {
  description = "The ID of the VPC within HUAWEI Cloud"
}

variable "network_id" {
  description = "The ID of the subnet network within HUAWEI Cloud"
}

variable "secgroup_id" {
  description = "The ID of the security group within HUAWEI Cloud"
}

variable "az_names" {
  description = "The name list of availability zones within HUAWEI Cloud"
}
