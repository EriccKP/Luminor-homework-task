resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  version  = var.kubernetes_version
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = [
      var.private_subnet_id,
      var.public_subnet_id
    ]
  }

  depends_on = [
    var.cluster_role_policy_attachment,
    var.vpc_resource_controller_policy_attachment
  ]
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-nodegroup"
  node_role_arn   = var.node_role_arn

  subnet_ids      = [
    var.private_subnet_id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 0
  }
  
  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  depends_on = [
    var.worker_node_policy_attachment,
    var.eks_cni_policy_attachment,
    var.container_registry_policy_attachment,
  ] 
}


resource "aws_launch_template" "main" {
  name_prefix = "${var.cluster_name}-launch-template"
  

  instance_type = var.instance_type[0]
      
  metadata_options {
    http_tokens = "optional"
  }
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.cluster_name}-node"
    }
  }

}
