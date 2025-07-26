variable "cluster_name" {}
variable "cluster_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
  default = {}
}