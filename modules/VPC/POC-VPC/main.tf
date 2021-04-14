# vpc.tf
# Create VPC/Subnet/Security Group/Network ACL
# create the VPC

resource "aws_vpc" "POC_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "POC VPC"
}
} # end resource
# create the Subnet
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.publicCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZonea
tags = {
   Name = "POC public Subnet 1"
}
} # end resource
# create the Subnet
resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.publicCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZoneb
tags = {
   Name = "POC public Subnet 2"
}
} # end resource
# create the Subnet
resource "aws_subnet" "app-1" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.appCIDRblock
  availability_zone       = var.availabilityZonea
tags = {
   Name = "POC app Subnet"
}
} # end resource
# create the Subnet
resource "aws_subnet" "app-2" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.appCIDRblock
  availability_zone       = var.availabilityZoneb
tags = {
   Name = "POC app Subnet"
}
} # end resource


# create the Subnet
resource "aws_subnet" "Data_Subnet" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.dataCIDRblock
  availability_zone       = var.availabilityZonea
tags = {
   Name = "POC DATA Subnet"
}
} # end resource


# create the Subnet
resource "aws_subnet" "Data-2" {
  vpc_id                  = aws_vpc.POC_VPC.id
  cidr_block              = var.dataCIDRblock
  availability_zone       = var.availabilityZoneb
tags = {
   Name = "POC DATA Subnet"
}
} # end resource

# Create the Security Group
resource "aws_security_group" "POC_VPC_Security_Group" {
  vpc_id       = aws_vpc.POC_VPC.id
  name         = "POC VPC Security Group"
  description  = "POC VPC Security Group"

  # allow ingress of port 22
  ingress {
    cidr_blocks = var.ingressCIDRblock
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # allow egress of all ports
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
   Name = "POC VPC Security Group"
   Description = "POC VPC Security Group"
}
} # end resource
# create VPC Network access control list
resource "aws_network_acl" "POC_VPC_Security_ACL" {
  vpc_id = aws_vpc.POC_VPC.id
  subnet_ids = [ aws_subnet.public-1.id ]
  subnet_ids = [ aws_subnet.public-2.id ]
# allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22
    to_port    = 22
  }

  # allow ingress port 80
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80
    to_port    = 80
  }

  # allow ingress ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }

  # allow egress port 22
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22
    to_port    = 22
  }

  # allow egress port 80
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80
    to_port    = 80
  }

  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
tags = {
    Name = "POC VPC ACL"
}
} # end resource
# Create the Internet Gateway
resource "aws_internet_gateway" "POC_VPC_GW" {
 vpc_id = aws_vpc.POC_VPC.id
 tags = {
        Name = "POC VPC Internet Gateway"
}
} # end resource
# Create the Route Table
resource "aws_route_table" "POC_VPC_route_table" {
 vpc_id = aws_vpc.POC_VPC.id
 tags = {
        Name = "POC VPC Route Table"
}
} # end resource
# Create the Internet Access
resource "aws_route" "POC_VPC_internet_access" {
  route_table_id         = aws_route_table.POC_VPC_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.POC_VPC_GW.id
} # end resource
# Associate the Route Table with the Subnet
resource "aws_route_table_association" "POC_VPC_association" {
  subnet_id      = aws_subnet.public-1.id
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.POC_VPC_route_table.id
}

# end resource
# end vpc.tf
