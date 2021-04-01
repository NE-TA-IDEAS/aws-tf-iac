# Use AWS Terraform provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "poc-tfstate-iac"
    key    = "poc_tfstate_files/s3_tf"
    region = "us-east-2"
  }
}

# S3 bucket to store tfstate files
resource "aws_s3_bucket" "b" {
  bucket = "poc-tfstate-files"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
     }
   }
 }

  tags = {
    Name        = "poc-tfstate-files"
    Environment = "poc"
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
