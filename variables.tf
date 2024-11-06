variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cidr_block_private" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "cidr_block_public" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = list(string)
}

variable "github_token" {
  description = "GitHub token for Atlantis"
  type        = string
  sensitive   = true
}

variable "webhook_secret" {
  description = "GitHub webhook secret for Atlantis"
  type        = string
  sensitive   = true
}

variable "github_username" {
  description = "GitHub username for Atlantis"
  type        = string
}

variable "orgAllowlist" {
  description = "GitHub org allowlist for Atlantis"
  type        = string
}
