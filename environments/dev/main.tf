
module "eks" {
  source           = "../../modules/eks"
  env              = var.env
  cluster_name     = var.cluster_name
  subnet_ids       = var.subnet_ids
  environment      = var.environment
  region           = var.region 
  vpc_cidr         = var.vpc_cidr
  public_subnets      = var.public_subnets    
  private_subnets     = var.private_subnets 
  node_desired_size   = var.node_desired_size
  node_max_size       = var.node_max_size
  node_min_size       = var.node_min_size
}


