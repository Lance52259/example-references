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

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  project_id = var.project_id
}

data "huaweicloud_availability_zones" "test" {}

module "network_service" {
  source = "./modules/network"

  name_prefix = var.network_name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "ecs_service" {
  source = "./modules/ecs"

  worker_number     = var.worker_number
  name_prefix       = var.ecs_name_prefix
  image_name        = var.image_name
  az_names          = data.huaweicloud_availability_zones.test.names
  network_id        = module.network_service.network_id
  security_group_id = module.network_service.security_group_id
  eip_id            = module.network_service.eip_id
}
