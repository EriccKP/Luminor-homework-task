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

variable "private_subnet_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the first public subnet"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EKS worker nodes"
  type        = string
}

variable "cluster_role_policy_attachment" {
  description = "IAM policy attachment for EKS cluster"
}

variable "vpc_resource_controller_policy_attachment" {
  description = "IAM policy attachment for VPC resource controller"
}

variable "worker_node_policy_attachment" {
  description = "IAM policy attachment for worker node"
}

variable "eks_cni_policy_attachment" {
  description = "IAM policy attachment for EKS CNI"
}

variable "container_registry_policy_attachment" {
  description = "IAM policy attachment for container registry"
}