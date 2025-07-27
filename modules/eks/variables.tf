variable "region" {
  type    = string
  default = "us-east-1"
}

variable "env" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "node_desired_size" {
  default = 2
}

variable "node_min_size" {
  default = 1
}

variable "node_max_size" {
  default = 3
}

