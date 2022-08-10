terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.38.2"
    }
  }
}

data "huaweicloud_availability_zones" "default" {}

data "huaweicloud_cce_addon_template" "metrics" {
  cluster_id = huaweicloud_cce_cluster.default.id
  name       = "metrics-server"
  version    = "1.2.1"
}

resource "huaweicloud_vpc_eip" "default" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    share_type  = "PER"
    size        = 5
    name        = "test"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_vpc" "default" {
  name = var.vpc_name
  cidr = var.vpc_cidr
}

resource "huaweicloud_vpc_subnet" "default" {
  vpc_id      = huaweicloud_vpc.default.id

  name        = var.subnet_name
  cidr        = cidrsubnet(var.vpc_cidr, 4, 1)
  gateway_ip  = cidrhost(cidrsubnet(var.vpc_cidr, 4, 1), 1)
  ipv6_enable = true
}

resource "huaweicloud_cce_cluster" "default" {
  vpc_id    = huaweicloud_vpc.default.id
  subnet_id = huaweicloud_vpc_subnet.default.id

  flavor_id       = "cce.s2.medium"
  cluster_version = "v1.21"
  cluster_type    = "VirtualMachine"

  name                   = "${cce_name_prefix}-cluster"
  description            = "Test for master node"
  container_network_type = "vpc-router"
  kube_proxy_mode        = "iptables"
}


resource "huaweicloud_kps_keypair" "default" {
  name = var.keypair_name
}

resource "huaweicloud_cce_node" "default" {
  cluster_id        = huaweicloud_cce_cluster.default.id
  name              = "${cce_name_prefix}-cluster"
  flavor_id         = "c6s.xlarge.2"
  availability_zone = data.huaweicloud_availability_zones.default.names[0]
  key_pair          = huaweicloud_kps_keypair.default.name
  # kube_proxy_mode   = "iptables"

  postinstall = base64encode(<<EOT
#!/bin/bash
groupadd -g 1001 ers
useradd -u 1001 -g 1001 ers
mkdir -p /mnt/daemonset
chown -R 1001:1001 /mnt/daemonset
chmod -R 777 /mnt/daemonset
mount /dev/vdc /mnt/daemonset
echo "/dev/vdc /mnt/daemonset xfs defaults 1 0" >> /etc/fstab
mkdir -p /var/BigData/bi/bifilebeat/logs/
chmod 750 /var/BigData/bi/bifilebeat/logs/
mkdir -p /var/BigData/bi/bifilebeat/config
chmod 750 /var/BigData/bi/bifilebeat/config/
mkdir -p /var/BigData/bi/bifilebeat/data
chmod 750 /var/BigData/bi/bifilebeat/data
mkdir -p /var/BigData/bi/datapush/conf/
chmod 750 /var/BigData/bi/datapush/conf/
mkdir -p /var/BigData/bi/datapush/logs/
chmod 750 /var/BigData/bi/datapush/logs/
mkdir -p /var/BigData/bi/crdcontroller/logs/
chmod 750 /var/BigData/bi/crdcontroller/logs/
chown -R 1001:1001 /var/BigData/bi
chmod -R 750 /var/BigData/bi
EOT
)

  root_volume {
    size       = 80
    volumetype = "SSD"
  }
  data_volumes {
    size       = 200
    volumetype = "SSD"
  }
  data_volumes {
    size       = 200
    volumetype = "SSD"
  }
}

resource "huaweicloud_cce_addon" "metrics" {
  depends_on = [
    huaweicloud_cce_node.default
  ]

  cluster_id = huaweicloud_cce_cluster.default.id

  template_name = data.huaweicloud_cce_addon_template.metrics.name
  version       = data.huaweicloud_cce_addon_template.metrics.version

  values {
    basic_json  = jsonencode(jsondecode(data.huaweicloud_cce_addon_template.metrics.spec).basic)
    flavor_json = jsonencode(jsondecode(data.huaweicloud_cce_addon_template.metrics.spec).parameters.flavor2)
  }
}
