
module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "dev-eks-cluster"
  region           = var.region
  subnet_ids       = var.subnet_ids
  environment      = var.environment
  cluster_role_arn = module.iam.cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
}

