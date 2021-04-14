variable "region" {
     default = "us-east-2"
}
variable "availabilityZonea" {
     default = "us-east-2a"
}
variable "availabilityZoneb" {
     default = "us-east-2b"
}


variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}
variable "publicCIDRblock1" {
    default = "10.0.1.0/24"
}

variable "publicCIDRblock2" {
    default = "10.0.2.0/24"
}
variable "appCIDRblock1" {
    default = "10.0.3.0/24"
}

variable "appCIDRblock2" {
    default = "10.0.4.0/24"
}
variable "dataCIDRblock1" {
    default = "10.0.5.0/24"
}

variable "dataCIDRblock2" {
    default = "10.0.6.0/24"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "72.200.161.135/32" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}
# end of variables.tf
