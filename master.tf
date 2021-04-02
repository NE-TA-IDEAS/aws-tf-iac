/*
    # Use AWS Terraform provider
module "backend-S3" {
    source                  = "./modules/s3/backend-s3"
}

#VPC module
    module "poc-vpc" {
    source                  = "./modules/VPC/POC-VPC"
}
*/
#Ec2 module        
    module "ec2" {
    source                  = "git@github.com:hashicorp/example.git//tf-modules/modules/EC2/poc-ec2"
}

