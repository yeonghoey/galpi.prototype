terraform {
  backend "s3" {
    key = "galpi/terraform.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

# Some Zappa features supports only us-east-1
provider "aws" {
  alias  = "zappa"
  region = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket = "${var.bucket}"
}

resource "aws_acm_certificate" "main" {
  provider = "aws.zappa"
  domain_name = "*.${var.domain}"
  validation_method = "DNS"
}
