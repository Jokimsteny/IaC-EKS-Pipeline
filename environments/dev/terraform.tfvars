env           = "dev"
cluster_name  = "dev-eks-cluster"
environment   = "dev"
region        = "us-east-1"
vpc_cidr      = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
node_desired_size = 2
node_max_size     = 4
node_min_size     = 1
subnet_ids = [
  "subnet-012c01e8bb86c178d",
  "subnet-09ed116567b831a84",
  "subnet-0669af2e132b41651",
  "subnet-0baf493ece2ba5fc0",
  "subnet-08b19c05d01f81814"
]

