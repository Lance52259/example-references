terraform {
  required_providers {
    huaweicloud = {
      # source  = "huaweicloud/huaweicloud"
      source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.38.2"
    }
  }
}

resource "huaweicloud_vpc" "default" {
  name = format("%s-vpc", var.name_prefix)
  cidr = var.vpc_cidr
}

resource "huaweicloud_vpc_subnet" "default" {
  vpc_id = huaweicloud_vpc.default.id

  name        = format("%s-subnet", var.name_prefix)
  cidr        = cidrsubnet(var.vpc_cidr, 4, 1)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 4, 1), 1)
  ipv6_enable = true
}

resource "huaweicloud_vpc_subnet" "subnet_123" {
  vpc_id = huaweicloud_vpc.default.id

  name        = "subnet-123"
  cidr        = "192.168.128.0/24"
  gateway_ip  = "192.168.128.1"
}

resource "huaweicloud_networking_secgroup" "default" {
  name                 = format("%s-secgroup", var.name_prefix)
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "in_v4_icmp_all" {
  security_group_id = huaweicloud_networking_secgroup.default.id
  ethertype         = "IPv4"
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "in_v4_all_group" {
  security_group_id = huaweicloud_networking_secgroup.default.id
  ethertype         = "IPv4"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.default.id
}

resource "huaweicloud_networking_secgroup_rule" "in_v6_all_group" {
  security_group_id = huaweicloud_networking_secgroup.default.id
  ethertype         = "IPv6"
  direction         = "ingress"
  remote_group_id   = huaweicloud_networking_secgroup.default.id
}

resource "huaweicloud_networking_secgroup_rule" "out_v4_all" {
  security_group_id = huaweicloud_networking_secgroup.default.id
  ethertype         = "IPv4"
  direction         = "egress"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "out_v6_all" {
  security_group_id = huaweicloud_networking_secgroup.default.id
  ethertype         = "IPv6"
  direction         = "egress"
  remote_ip_prefix  = "::/0"
}
