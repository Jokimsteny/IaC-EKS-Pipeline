variable "region" {
  default = "us-east-1"
}

variable "subnet_ids" {
  default = ["subnet-xxxxxxx", "subnet-yyyyyyy"] # Replace with your subnet IDs
}

variable "environment" {
  default = "dev"
}

provider "aws" {
  region = var.region
}

module "iam" {
  source      = "../../iam"
  region      = var.region
  environment = var.environment
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "dev-eks-cluster"
  region           = var.region
  subnet_ids       = var.subnet_ids
  environment      = var.environment
  cluster_role_arn = module.iam.cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
}

