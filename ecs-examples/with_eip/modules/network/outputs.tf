output "vpc_id" {
  description = "The ID of the VPC resource within HUAWEI Cloud"
  value       = huaweicloud_vpc.default.id
}

output "network_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.default.id
}

output "security_group_id" {
  description = "The network ID of the subnet resource for VPC service within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.default.id
}

output "eip_id" {
  description = "The ID of EIP resource within HUAWEI Cloud"
  value       = huaweicloud_vpc_eip.default.id
}
