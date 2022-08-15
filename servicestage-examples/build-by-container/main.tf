terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "=1.39.0"
    }
  }
}

provider "huaweicloud" {
  region     = var.region
  user_name  = var.user_name
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

# module "eip_service" {
#   source = "./modules/eip"

#   bandwidth_name = var.bandwidth_name
# }

# module "cce_service" {
#   source = "./modules/cce"

#   keypair_name = var.keypair_name
#   name_prefix  = var.cce_name_prefix
#   az_names     = data.huaweicloud_availability_zones.default.names
#   vpc_id       = module.network_service.vpc_id
#   network_id   = module.network_service.network_id
#   secgroup_id  = module.network_service.secgroup_id
#   eip_address  = module.eip_service.ip_address
# }

# module "cse_service" {
#   source = "./modules/cse"

#   az_names    = data.huaweicloud_availability_zones.default.names
#   network_id  = module.network_service.network_id
#   name_prefix = var.cse_name_prefix
# }

# module "servicestage_service" {
#   source = "./modules/servicestage"

#   vpc_id                       = module.network_service.vpc_id
#   cce_cluster_id               = module.cce_service.cluster_id
#   cse_engine_id                = module.cse_service.engine_id
#   github_host                  = var.github_host
#   github_personal_access_token = var.github_personal_access_token
#   name_prefix                  = var.servicestage_name_prefix
#   image_version                = var.image_version
#   image_url                    = var.image_url
#   flavor_id                    = var.component_instance_flavor_id
# }
