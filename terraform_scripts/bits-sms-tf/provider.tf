terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA6FR5FZ2JNNWPY7VF"
  secret_key = "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"
}