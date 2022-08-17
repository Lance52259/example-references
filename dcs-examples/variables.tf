################################################################
###  Network

variable "network_name_prefix" {
  description = "The name prefix for VPC resources within HUAWEI Cloud"
  default     = "script-dcs-instnaces-modules-network"
}

variable "vpc_cidr" {
  description = "The CIDR of the Huaweicloud VPC"
  default     = "172.16.0.0/16"
}

################################################################
###  DCS

variable "dcs_name_prefix" {
  description = "The prefix name for the DCS resources within HUAWEI Cloud"
  default     = "script-dcs-instnaces-modules-dcs"
}
