# Terraform EKS node module

## Requirements
Binary version ```v1.3.2```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.41.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_AutoscalingFullAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [local_file.rsa_private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## How to
Set default configuration
```
module "node" {
  source = "github.com/diego1277/terraform-eks-node.git"
  name = "my-node-name"
  cluster_name = "my-cluster-name"
  subnets_id = ["my-subnet-id-01","my-subnet-id-02"]
  instance_types = ["t3.medium"]
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | additional tags | `map(any)` | `{}` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | capacity type ON\_DEMAND/SPOT | `string` | `"SPOT"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | cluster name | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | size | `number` | `1` | no |
| <a name="input_generate_key_pair"></a> [generate\_key\_pair](#input\_generate\_key\_pair) | auto generate ssh key pair | `bool` | `true` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | instace types | `list(string)` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | max instances | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | min instances | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | node name | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | ssh key name | `string` | `""` | no |
| <a name="input_subnets_id"></a> [subnets\_id](#input\_subnets\_id) | subnets id | `list(string)` | n/a | yes |
| <a name="input_taints"></a> [taints](#input\_taints) | node taints | `map(object({key=string,value=optional(string),effect=optional(string,"NO_SCHEDULE")}))` | `{}` | no |

## Outputs

No outputs.

## Author:
- `Diego Oliveira`                                                                                                 