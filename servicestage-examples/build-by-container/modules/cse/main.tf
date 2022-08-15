terraform {
  required_providers {
    huaweicloud = {
      # source  = "huaweicloud/huaweicloud"
      source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.38.2"
    }
  }
}

resource "huaweicloud_cse_microservice_engine" "default" {
  name       = format("%s-eg", var.name_prefix)
  network_id = var.network_id

  auth_type             = "NONE"
  flavor                = "cse.s1.small2"
  enterprise_project_id = "0"

  availability_zones = length(var.az_names) >= 3 ? slice(var.az_names, 0, 3) : element(var.az_names, 0, 1) 
}
