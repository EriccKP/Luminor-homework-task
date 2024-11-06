module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  cidr_block_private = var.cidr_block_private
  cidr_block_public = var.cidr_block_public
  cluster_name = var.cluster_name
}

module "iam" {
  source = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  kubernetes_version = var.kubernetes_version
  instance_type = var.instance_type
  public_subnet_id = module.vpc.public_subnet_id     
  private_subnet_id = module.vpc.private_subnet_id    
  cluster_role_arn  = module.iam.cluster_role_arn 
  node_role_arn     = module.iam.node_role_arn   
  cluster_role_policy_attachment = module.iam.cluster_role_policy_attachment
  vpc_resource_controller_policy_attachment = module.iam.vpc_resource_controller_policy_attachment
  worker_node_policy_attachment = module.iam.worker_node_policy_attachment
  eks_cni_policy_attachment = module.iam.eks_cni_policy_attachment
  container_registry_policy_attachment = module.iam.container_registry_policy_attachment
}

module "atlantis" {
  source = "./modules/atlantis"
  
  github_username = var.github_username
  github_token = var.github_token
  webhook_secret = var.webhook_secret
  private_subnet_id = module.vpc.private_subnet_id
  public_subnet_id = module.vpc.public_subnet_id
  orgAllowlist = var.orgAllowlist
}


