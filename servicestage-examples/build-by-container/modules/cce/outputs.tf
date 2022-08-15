output "cluster_id" {
  depends_on = [
    huaweicloud_cce_node.default
  ]

  value = huaweicloud_cce_cluster.default.id
}
