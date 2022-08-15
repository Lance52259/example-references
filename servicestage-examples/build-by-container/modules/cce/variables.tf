# variable "resource_num" {
#   description = "The total number of resources"
#   default     = 1
# }

variable "keypair_name" {
  description = "The name of DEW keypair within HUAWEI Cloud"
}

variable "name_prefix" {
  description = "The prefix name for cce resources within HUAWEI Cloud"
}

variable "vpc_id" {
  description = "The ID of the VPC within HUAWEI Cloud"
}

variable "network_id" {
  description = "The ID of the subnet network within HUAWEI Cloud"
}

variable "eip_address" {
  description = "The IP address of EIP within HUAWEI Cloud"
}

variable "az_names" {
  description = "The name list of availability zones within HUAWEI Cloud"
}

variable "secgroup_id" {
  description = "The ID of the security group within HUAWEI Cloud"
}
