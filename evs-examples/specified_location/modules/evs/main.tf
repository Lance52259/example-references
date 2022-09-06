terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">=1.40.1"
    }
  }
}

resource "huaweicloud_evs_volume" "default" {
  for_each = var.volume_configuration

  name              = format("%s-volume-%s", var.name_prefix, each.key)
  volume_type       = each.value["type"]
  size              = each.value["size"]
  availability_zone = var.az_names[0]
}
