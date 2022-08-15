# variable "resource_num" {
#   description = "The total number of resources"
#   default     = 1
# }

variable "vpc_id" {
  description = "The ID of the VPC within HUAWEI Cloud"
}

variable "name_prefix" {
  description = "The prefix name for the servicestage resources within HUAWEI Cloud"
}

variable "cce_cluster_id" {
  description = "The ID of the CCE cluster within HUAWEI Cloud"
}

variable "cse_engine_id" {
  description = "The ID of the CSE engine within HUAWEI Cloud"
}

variable "github_host" {
  description = "The host name of the Github reposity within HUAWEI Cloud"
}

variable "github_personal_access_token" {
  description = "The access token of the Github reposity within HUAWEI Cloud"
}

variable "flavor_id" {
  description = "The ID of the component instance flavor within HUAWEI Cloud"
}

variable "image_version" {
  description = "The version of the image for the component deployment within HUAWEI Cloud"
}

variable "image_url" {
  description = "The full path of the image for the component deployment within HUAWEI Cloud"
}
