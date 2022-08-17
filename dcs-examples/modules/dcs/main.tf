terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      # source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.39.0"
    }
  }
}

resource "huaweicloud_dcs_instance" "default" {
  name           = format("%s-instance", var.name_prefix)
  engine         = "Redis"
  capacity       = 4
  flavor         = "redis.cluster.au1.large.r2.4"
  engine_version = "5.0"

  vpc_id             = var.vpc_id
  subnet_id          = var.network_id
  availability_zones = [
    element(var.az_names, 0),
    element(var.az_names, 2),
  ]

  backup_policy {
    backup_type = "auto"
    begin_at    = "00:00-01:00"
    period_type = "weekly"
    backup_at   = [4]
    save_days   = 1
  }
}
