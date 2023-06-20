# AWS kubernetes resources

<br>

> :warning:, :red_circle:, :green_circle:

:warning:
:green_circle:

## Introduction

This module manages required AWS Kubernetes resources as EKS clusters.

Uses [terraform-aws-modules/eks/aws](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws) for implementation.

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "aws-eks" {
  source = "dodevops/kubernetes/aws"
  version = "<version>"
  
  (...)
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.10.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws-auth-map-roles"></a> [aws-auth-map-roles](#input\_aws-auth-map-roles) | Desired content of the aws-auth configmap | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version to use on EKS | `string` | `"1.16"` | no |
| <a name="input_nodegroups"></a> [nodegroups](#input\_nodegroups) | List of Nodegroup configurations<br><br>* suffix: Nodegroup name suffix<br>* subnet\_ids: Ids of used subnets in the nodegroup<br>* scaling: Scaling configuration<br>  * desired: Desired number of nodes<br>  * min: Minimum number of nodes<br>  * max: Maximum number of nodes<br>* disk\_size: Disk size in GB<br>* instance\_type: Instance type of the nodes} | <pre>list(object({<br>    suffix : string,<br>    subnet_ids : list(string),<br>    scaling : object({<br>      min : number,<br>      max : number,<br>      desired : number<br>    }),<br>    disk_size : number,<br>    instance_type : string<br>  }))</pre> | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project this configuration is for | `any` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Name of the stage for this state | `string` | n/a | yes |
| <a name="input_subnet_cidrs"></a> [subnet\_cidrs](#input\_subnet\_cidrs) | List of IDs of subnets to use in the EKS | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of IDs of subnets to use in the EKS | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC the cluster is in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs markdown . --output-file README.md
