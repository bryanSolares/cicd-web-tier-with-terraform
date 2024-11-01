terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-state-20241101"
    key     = "terraform.tfstate"
    region  = "us-east-2"
    profile = "development-stage"
  }
}

provider "aws" {
  profile = "development-stage"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-20241101"
  tags = {
    Name        = "terraform-state-20241101"
    Environment = "development-stage"
  }

}
