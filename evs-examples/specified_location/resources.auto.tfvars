network_name_prefix = "script-modules-ecs-data-disk-vpc"

image_name = "CentOS 7.9 64bit"

ecs_name_prefix = "script-modules-ecs-data-disk-ecs"

volume_configuration = {
  "vdb_volume" = {
    location = "/dev/vdb"
    size     = 460
    type     = "SAS"
  }
  "vdc_volume" = {
    location = "/dev/vdc"
    size     = 200
    type     = "SAS"
  }
}

evs_name_prefix = "script-modules-ecs-data-disk-evs"
