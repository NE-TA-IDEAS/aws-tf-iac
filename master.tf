# Use AWS Terraform provider
module "backend-S3" {
    source                  = "./modules/s3/backend-s3"
}
#VPC module
    module "poc-vpc" {
    source                  = "./modules/VPC/POC-VPC"   
 /*      availabilityZone        = var.availabilityZone
    instanceTenancy         = var.instanceTenancy
    dnsSupport              = var.dnsSupport
    dnsHostNames            = var.dnsHostNames
    vpcCIDRblock            = var.vpcCIDRblock
    subnetCIDRblock         = var.subnetCIDRblock
    destinationCIDRblock    = var.destinationCIDRblock
    ingressCIDRblock        = var.ingressCIDRblock
    egressCIDRblock         = var.egressCIDRblock
    mapPublicIP             = var.mapPublicIP
*/
}
#Ec2 module        
    module "ec2" {
    source                  = "./modules/EC2/poc-ec2"
}
