variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the cluster"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM Role ARN for EKS Cluster"
}

variable "node_group_role_arn" {
  type        = string
  description = "IAM Role ARN for Node Group"
}

