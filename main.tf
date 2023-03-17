module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.0"

  cluster_name    = "${lower(var.project)}${lower(var.stage)}k8s"
  cluster_version = var.k8s_version

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids

  eks_managed_node_group = {
    for group in var.nodegroups : group.suffix => {
      name           = "${lower(var.project)}${lower(var.stage)}k8snodegroup${group.suffix}"
      instance_types = [group.instance_type]

      min_size     = group.scaling.min
      desired_size = group.scaling.desired
      max_size     = group.scaling.max
      disk_size    = group.disk_size
      subnet_ids   = group.subnet_ids
    }
  }

  manage_aws_auth_configmap = true

  aws_auth_roles = var.aws-auth-map-roles
}
