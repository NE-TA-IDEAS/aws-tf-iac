# Use AWS Terraform provider
module "backend-S3" {
    source                  = "./modules/s3/backend-s3"
}

#VPC module
module "poc-vpc" {
    source                  = "./modules/VPC/POC-VPC"
}
