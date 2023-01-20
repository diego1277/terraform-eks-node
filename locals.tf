locals {
  common_tags = merge(var.additional_tags,{
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned",
    "k8s.io/cluster-autoscaler/enabled" = "true",
     }
  )
}
