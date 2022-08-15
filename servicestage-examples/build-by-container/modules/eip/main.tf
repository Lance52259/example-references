terraform {
  required_providers {
    huaweicloud = {
      # source  = "huaweicloud/huaweicloud"
      source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.38.2"
    }
  }
}

resource "huaweicloud_vpc_eip" "default" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    share_type  = "PER"
    size        = 5
    name        = var.bandwidth_name
    charge_mode = "traffic"
  }
}
