output "eip_id" {
  description = "The ID of the EIP within HUAWEI Cloud"
  value = huaweicloud_vpc_eip.default.id
}

output "ip_address" {
  description = "The IP address of the EIP within HUAWEI Cloud"
  value = huaweicloud_vpc_eip.default.address
}
