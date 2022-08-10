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

variable "ecs_instance_name" {
  description = "The name of the Huaweicloud RDS instance"
}

variable "remote_ip" {
  description = "IP address of the HuaweiCloud remote EIP"
}

variable "data_count" {
  description = "The DATA total numbers of the HuaweiCloud EVS volume"
  default     = 1
}

variable "flash_count" {
  description = "The FLASH total numbers of the HuaweiCloud EVS volume"
  default     = 1
}

variable "ocr_count" {
  description = "The OCR total numbers of the HuaweiCloud EVS volume"
  default     = 3
}
