terraform {
  required_version = ">= 1.2.8"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "ln-app-test-bucket1"
}

resource "aws_s3_account_public_access_block" "bucket1_block" {
  bucket = aws_s3_bucket.bucket1.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
}