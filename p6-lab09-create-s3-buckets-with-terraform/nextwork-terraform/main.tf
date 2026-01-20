provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "nextwork-unique-bucket-arpita-10"

  tags = {
    Project     = "NextWork-Terraform"
    Owner       = "Arpita"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "image.png"
  source = "image.png"
}
