provider "aws" {
  region = var.aws.region
}

# Certificates are issued in us-east-1 region to use it for Cloudfront.
provider "aws" {
  alias  = "us"
  region = "us-east-1"
}
