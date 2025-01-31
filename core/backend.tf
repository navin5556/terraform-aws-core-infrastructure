provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.0"
    }
  }

  backend "s3" {
    encrypt        = true
    dynamodb_table = "devops-redis-in-terraform-lock"
    bucket         = "devops-redis-in-terraform-states"
    key            = "core-infrastructure/sit-core-cluster.tfstate"
    region         = "ap-south-1"
  }
}

# Purpose:
# required_providers: Specifies the provider's source and version constraints.
# provider: Configures the settings for the provider.
# 
# Usage:
# required_providers ensures the correct version of the provider is used.
# provider sets up the necessary configuration to interact with the provider's API