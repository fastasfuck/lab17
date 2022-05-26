terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.prod,
        aws.dev
      ]
    }
  }
}
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  provider    = aws.prod
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  provider    = aws.prod
  bucket =  var.bucket_name
  acl    = "private"
}

resource "aws_s3_bucket" "a" {
  bucket = var.bucket_name2
  provider    = aws.prod
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example2" {
  provider    = aws.prod
  bucket =  var.bucket_name2
  acl    = "private"
}
