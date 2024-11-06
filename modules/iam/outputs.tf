output "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  value       = aws_iam_role.main.arn
}

output "node_role_arn" {
  description = "The ARN of the IAM role for the EKS worker nodes"
  value       = aws_iam_role.main-node.arn
}

output "cluster_role_policy_attachment" {
  value = aws_iam_role_policy_attachment.main-AmazonEKSClusterPolicy
}

output "vpc_resource_controller_policy_attachment" {
  value = aws_iam_role_policy_attachment.main-AmazonEKSVPCResourceController
}

output "worker_node_policy_attachment" {
  value = aws_iam_role_policy_attachment.main-AmazonEKSWorkerNodePolicy
}

output "eks_cni_policy_attachment" {
  value = aws_iam_role_policy_attachment.main-AmazonEKS_CNI_Policy
}

output "container_registry_policy_attachment" {
  value = aws_iam_role_policy_attachment.main-AmazonEC2ContainerRegistryReadOnly
}
