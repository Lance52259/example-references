terraform {
  required_providers {
    huaweicloud = {
      # source  = "huaweicloud/huaweicloud"
      source  = "local-registry/huaweicloud/huaweicloud"
      version = "=1.38.2"
    }
  }
}

resource "huaweicloud_servicestage_environment" "default" {
  name   = format("%s-environment", var.name_prefix)
  vpc_id = var.vpc_id

  basic_resources {
    type = "cce"
    id   = var.cce_cluster_id
  }

  optional_resources {
    type = "cse"
    id   = var.cse_engine_id
  }
}

resource "huaweicloud_servicestage_repo_token_authorization" "default" {
  type  = "github"
  name  = format("%s-github-auth", var.name_prefix)
  host  = var.github_host
  token = var.github_personal_access_token
}

resource "huaweicloud_servicestage_application" "default" {
  name = format("%s-application", var.name_prefix)
}

resource "huaweicloud_servicestage_component" "default" {
  application_id = huaweicloud_servicestage_application.default.id

  name      = format("%s-component", var.name_prefix)
  type      = "MicroService"
  runtime   = "Docker"
  framework = "Java Classis"
}

resource "huaweicloud_servicestage_component_instance" "default" {
  application_id = huaweicloud_servicestage_application.default.id
  component_id   = huaweicloud_servicestage_component.default.id
  environment_id = huaweicloud_servicestage_environment.default.id

  name        = "${var.name_prefix}-instance"
  version     = "1.0.2"
  replica     = 1
  flavor_id   = var.flavor_id
  description = "Created by terraform test"

  artifact {
    name      = huaweicloud_servicestage_component.default.name
    type      = "image"
    storage   = "swr"
    url       = var.image_url
    auth_type = "iam"
  }

  refer_resource {
    type = "cce"
    id   = var.cce_cluster_id
    parameters = {
      type      = "VirtualMachine"
      namespace = "default"
    }
  }

  refer_resource {
    type = "cse"
    id   = var.cse_engine_id
  }

  configuration {
    env_variable {
      name  = "MOCK_ENABLED"
      value = "false"
    }

    log_collection_policy {
      host_path = "/tmp"

      container_mounting {
        path             = "/tmp/01"
        host_extend_path = "None"
        aging_period     = "Hourly"
      }
      container_mounting {
        path             = "/tmp/02"
        host_extend_path = "None"
        aging_period     = "Daily"
      }
      container_mounting {
        path             = "/tmp/03"
        host_extend_path = "None"
        aging_period     = "Weekly"
      }
      container_mounting {
        path             = "/tmp/04"
        host_extend_path = "PodUID"
        aging_period     = "Weekly"
      }
      container_mounting {
        path             = "/tmp/05"
        host_extend_path = "PodName"
        aging_period     = "Weekly"
      }
      container_mounting {
        path             = "/tmp/06"
        host_extend_path = "PodUID/ContainerName"
        aging_period     = "Weekly"
      }
    }
    log_collection_policy {
      container_mounting {
        path         = "/mytest/01"
        aging_period = "Hourly"
      }
    }
    # env_variable {
    #   name  = "TZ"
    #   value = "Asia/Shanghai"
    # }
  }
}
