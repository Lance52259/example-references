variable "az_names" {
  description = "The name list of availability zones within HUAWEI Cloud"

  type = list(string)
}

variable "volume_configuration" {
  description = "The configuration list of EVS volumes within HUAWEI Cloud"

  type = map(object({
    location = string
    type     = string
    size     = number
  }))
}

variable "name_prefix" {
  description = "The name prefix for EVS resources within HUAWEI Cloud"

  type = string
}
