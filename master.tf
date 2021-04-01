# Use AWS Terraform provider
module "backend-S3" {
    source                  = "./modules/s3/backend-s3"
}
