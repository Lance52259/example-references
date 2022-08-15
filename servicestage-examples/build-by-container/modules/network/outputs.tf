output "vpc_id" {
  description = "The ID of the VPC within HUAWEI Cloud"
  value       = huaweicloud_vpc.default.id
}

output "network_id" {
  description = "The ID of the subnet network within HUAWEI Cloud"
  value       = huaweicloud_vpc_subnet.default.id
}

output "secgroup_id" {
  description = "The ID of the security group within HUAWEI Cloud"
  value       = huaweicloud_networking_secgroup.default.id
}
