# Use AWS Terraform provider
module "backend-S3" {
    source                  = "./modules/s3/backend-s3"
}
#VPC module
    module "poc-vpc" {
    source                  = "./modules/VPC/POC-VPC"
/*      region                  = var.region
    availabilityZone        = var.availabilityZone
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
