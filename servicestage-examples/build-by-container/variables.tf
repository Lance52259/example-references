################################################################
###  Network

variable "network_name_prefix" {
  description = "The name prefix for VPC resources within HUAWEI Cloud"
  default     = "script-modules-network"
}

variable "vpc_cidr" {
  description = "The CIDR of the Huaweicloud VPC"
  default     = "172.16.0.0/16"
}

variable "environment_name" {
  description = "The name of the HuaweiCloud ServiceStage environment"
  default     = "script_servicestage_components_env"
}

variable "application_name" {
  description = "The ID of the ServiceStage Application"
  default     = "script-servicestage-components-application"
}

variable "component_name" {
  description = "The name of the ServiceStage Component"
  default     = "fusionweather"
}

variable "instance_name" {
  description = "The name of the ServiceStage Component instance"
  default     = "fusionweather-instance"
}

variable "flavor_id" {
  description = "The custom flavor ID of the ServiceStage Component instance"
  default     = "CUSTOM-10G:250m-250m:0.5Gi-0.5Gi"
}

################################################################
###  CSE

variable "cse_name_prefix" {
  description = "The name of the HuaweiCloud CSE Microservice engine"
  default     = "script-modules-cse"
}

################################################################
###  CCE

variable "keypair_name" {
  description = "The name of DEW keypair within HUAWEI Cloud"
  default     = "script-modules-dew-keypair"
}

variable "cce_name_prefix" {
  description = "The prefix name for cce resources within HUAWEI Cloud"
  default     = "script-modules-cce"
}

################################################################
###  EIP

variable "bandwidth_name" {
  description = "The name of the EIP bandwidth within HUAWEI Cloud"
  default     = "script-modules-eip-bandwidth"
}

################################################################
###  ServiceStage

variable "servicestage_name_prefix" {
  description = "The prefix name for the servicestage resources within HUAWEI Cloud"
  default     = "script-modules-servicestage"
}

variable "github_host" {
  description = "The host name of the Github repository"
  default     = "Lance52259"
}

variable "github_personal_access_token" {
  description = "The token content of the Github account"
  default     = "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"
}

variable "image_version" {
  description = "The version of the image for the component deployment within HUAWEI Cloud"
  default     = "1.0.2"
}

variable "image_url" {
  description = "The full path of the image for the component deployment within HUAWEI Cloud"
  default     = "swr.cn-north-4.myhuaweicloud.com/servicestage-terraform/fusionweather:v1.0.2"
}

variable "component_instance_flavor_id" {
  description = "The ID of the component instance flavor within HUAWEI Cloud"
  default     = "CUSTOM-15G:500m-500m:1Gi-1Gi"
}
