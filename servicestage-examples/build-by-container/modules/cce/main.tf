terraform {
  required_providers {
    huaweicloud = {
      # source  = "huaweicloud/huaweicloud"
      source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.38.2"
    }
  }
}

data "huaweicloud_compute_flavors" "default" {
  availability_zone = var.az_names[0]

  performance_type = "normal"
  cpu_core_count   = 8
  memory_size      = 16
}

resource "huaweicloud_kps_keypair" "default" {
  name = var.keypair_name
}

resource "huaweicloud_cce_cluster" "default" {
  name      = format("%s-cluster", var.name_prefix)
  vpc_id    = var.vpc_id
  subnet_id = var.network_id
  eip       = var.eip_address

  flavor_id              = "cce.s2.medium"
  container_network_type = "vpc-router"
  cluster_version        = "v1.21"
  cluster_type           = "VirtualMachine"

  kube_proxy_mode = "iptables"

  dynamic "masters" {
    for_each = slice(var.az_names, 0, 3)

    content {
      availability_zone = masters.value
    }
  }

  lifecycle {
    ignore_changes = [
      kube_proxy_mode,
    ]
  }
}

resource "huaweicloud_cce_node" "default" {
  cluster_id = huaweicloud_cce_cluster.default.id
  flavor_id  = data.huaweicloud_compute_flavors.default.ids[0]
  key_pair   = huaweicloud_kps_keypair.default.name

  name              = format("%s-node", var.name_prefix)
  availability_zone = var.az_names[0]

  root_volume {
    size       = 80
    volumetype = "SSD"
  }
  data_volumes {
    size       = 200
    volumetype = "SSD"
  }
}
