variable "vpc_name" {
  description = "The name of the Huaweicloud VPC"
}

variable "vpc_cidr" {
  description = "The CIDR of the Huaweicloud VPC"
  default     = "172.16.0.0/16"
}

variable "subnet_name" {
  description = "The name of the Huaweicloud Subnet"
}

variable "security_group_name" {
  description = "The name of the Huaweicloud Security Group"
}

variable "keypair_name" {
  description = "The name of the Huaweicloud DEW secret key"
}

variable "cce_name_prefix" {
  description = "The name prefix for CCE resources within HUAWEI Cloud"
}
