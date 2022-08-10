variable "elb_name_prefix" {
  description = "The name prefix for ELB resources within HUAWEI Cloud"
}

variable "vpc_name" {
  description = "The name of the Huaweicloud VPC"
}

variable "vpc_cidr" {
  description = "The CIDR of the Huaweicloud VPC"
  default     = "172.16.0.0/16"
}

variable "subnet_name" {
  description = "The name of the Huaweicloud VPC subnet"
}

variable "security_group_name" {
  description = "The name of the Huaweicloud security group"
}

variable "ecs_instance_name" {
  description = "The name of the Huaweicloud ECS instance"
}

variable "network_acl_name_prefix" {
  description = "The name prefix for network ACL resources within Huaweicloud"
}
