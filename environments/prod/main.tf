provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "prod-cluster"
  cluster_role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole"
  subnet_ids       = ["subnet-ccc", "subnet-ddd"]
  tags = {
    Environment = "prod"
  }
}