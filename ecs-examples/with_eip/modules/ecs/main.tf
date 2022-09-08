terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.40.1"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.0.0"
    }
  }
}

data "huaweicloud_compute_flavors" "default" {
  availability_zone = var.az_names[0]
  performance_type  = "normal"
  cpu_core_count    = 2
  memory_size       = 4
}

data "huaweicloud_images_image" "default" {
  name        = var.image_name
  most_recent = true
}

resource "random_password" "default" {
  length           = 16
  special          = true
  min_numeric      = 1
  min_lower        = 1
  min_special      = 1
  override_special = "!#"
}

resource "huaweicloud_compute_instance" "master" {
  depends_on = [
    huaweicloud_compute_instance.worker
  ]

  name               = format("%s-instance-master", var.name_prefix)
  image_id           = data.huaweicloud_images_image.default.id
  flavor_id          = data.huaweicloud_compute_flavors.default.ids[0]
  availability_zone  = var.az_names[0]
  security_group_ids = [var.security_group_id]

  admin_pass = random_password.default.result

  network {
    fixed_ip_v4 = "172.16.16.22"
    uuid        = var.network_id
  }

  eip_id = var.eip_id

  system_disk_type = "SAS"
  system_disk_size = 40
}

resource "huaweicloud_compute_instance" "worker" {
  count = var.worker_number

  name               = format("%s-instance-worker-%d", var.name_prefix, count.index)
  image_id           = data.huaweicloud_images_image.default.id
  flavor_id          = data.huaweicloud_compute_flavors.default.ids[0]
  availability_zone  = var.az_names[0]
  security_group_ids = [var.security_group_id]

  admin_pass = random_password.default.result

  network {
    uuid = var.network_id
  }

  system_disk_type = "SAS"
  system_disk_size = 40
}
