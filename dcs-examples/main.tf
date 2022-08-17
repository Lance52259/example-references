terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      # source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.39.0"
    }
  }
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  project_id = var.project_id
}

data "huaweicloud_availability_zones" "default" {}

module "network_service" {
  source = "./modules/network"

  name_prefix = var.network_name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "dcs_service" {
  source = "./modules/dcs"

  vpc_id      = module.network_service.vpc_id
  network_id  = module.network_service.network_id
  secgroup_id = module.network_service.secgroup_id
  name_prefix = var.dcs_name_prefix
  az_names     = data.huaweicloud_availability_zones.default.names
}
