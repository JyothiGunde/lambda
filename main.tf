terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source = "./modules/iam"
}

module "logs" {
  source = "./modules/logs"
}

module "lambda" {
  source = "./modules/lambda"
  iam_role = module.iam.role_arn
}

terraform {
  backend "s3" {
    bucket = "terraform-github-actions-jyothi-gunde"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
