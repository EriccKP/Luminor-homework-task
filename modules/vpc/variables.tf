variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "cidr_block_private" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "cidr_block_public" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

