


# Build the AWS Transit 

module "transit_aws_1" {
  source  = "terraform-aviatrix-modules/aws-transit/aviatrix"
  version = "v4.0.3"

  cidr = "10.77.0.0/20"
  region = "eu-central-1"
  account = "Eskimoo"

  name = "avffhub"
  ha_gw = "false"
  instance_size = "t2.micro"
}


# Build the AWS Spoke 1

module "spoke_aws_1" {
  source  = "Eskimoodigital/aws-spoke-ec2/aviatrix"
  version = "1.0.11"

  name            = "avffsp1"
  cidr            = "10.77.16.0/20"
  region          = "eu-central-1"
  account         = "Eskimoo"
  transit_gw      = "avx-avffhub-transit"
  vpc_subnet_size = "24"
  
  

  ha_gw = "false"
  instance_size = "t2.micro"
}

# Build the AWS Spoke 2

module "spoke_aws_2" {
  source  = "Eskimoodigital/aws-spoke-ec2/aviatrix"
  version = "1.0.11"

  name            = "avffsp2"
  cidr            = "10.77.32.0/20"
  region          = "eu-central-1"
  account         = "Eskimoo"
  transit_gw      = "avx-avffhub-transit"
  
  

  ha_gw = "false"
  instance_size = "t2.micro"
}

  
  
