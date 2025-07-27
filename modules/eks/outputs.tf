output "vpc_id" {
  value = aws_vpc.main.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_node_group" {
  value = aws_eks_node_group.node_group.id
}
