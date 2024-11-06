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

variable "orgAllowlist" {
  description = "GitHub org allowlist for Atlantis"
  type        = string
}

variable "github_username" {
  description = "GitHub username for Atlantis"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the first public subnet"
  type        = string
}