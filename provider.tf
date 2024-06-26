terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.54.1"
    }
  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  region = var.AWS_REGION
}