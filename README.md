# Atlantis EKS Cluster Deployment

## Prerequisites

* AWS account with necessary permissions
* Terraform installed on your machine
* AWS CLI installed and configured on your machine
* GitHub account with a personal access token and webhook secret

## Usage

1. Clone this repository to your machine.
2. Fill in the required variables in the `terraform.tfvars` file.
3. Run `terraform init` to initialize the Terraform working directory.
4. Run `terraform apply` to deploy the Atlantis EKS cluster.
5. Wait for the deployment to complete. This may take several minutes.
6. Once the deployment is complete, you can access your Atlantis instance using the LoadBalancer DNS name.
7. After Atlantis is deployed, set up your webhook in GitHub.

## Variables

The following variables are required for deployment:

* `cidr_block`: The CIDR block for the VPC.
* `cidr_block_private`: The CIDR block for the private subnet.
* `cidr_block_public`: The CIDR block for the public subnet.
* `cluster_name`: The name of the EKS cluster.
* `kubernetes_version`: The version of Kubernetes to use.
* `instance_type`: The instance type for the EKS cluster nodes.
* `github_token`: The GitHub personal access token for Atlantis.
* `webhook_secret`: The GitHub webhook secret for Atlantis.
* `github_username`: The GitHub username for Atlantis.
* `orgAllowlist`: The GitHub org allowlist for Atlantis.
* `region`: The AWS region to deploy the cluster in.


