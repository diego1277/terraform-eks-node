resource "aws_eks_node_group" "this" {
    
  cluster_name    = var.cluster_name
  node_group_name = var.name
  node_role_arn   = aws_iam_role.node.arn
  capacity_type = var.capacity_type
  instance_types = var.instance_types
  version = var.node_version
  subnet_ids = var.subnets_id

  remote_access {
    ec2_ssh_key = try(aws_key_pair.this[0].id,var.ssh_key_name)
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

 dynamic "taint" {
    for_each = var.taints
      content {
        key = taint.value.key
        value = taint.value.value
        effect = taint.value.effect
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = local.common_tags
}

resource "aws_iam_instance_profile" "nodes" {
  name = "${var.cluster_name}-instance-profile"
  role = aws_iam_role.eks_nodes_roles.name
}
