terraform {
  required_version = "= 1.1.6"
  backend "s3" {
    bucket = "kikyomits-terraform"
    key    = "tfstate"
    region = "ap-southeast-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }
  }
}