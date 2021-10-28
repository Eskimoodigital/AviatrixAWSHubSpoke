


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

# Build the AWS Spokes

module "spoke_aws" {
  source  = "Eskimoodigital/aws-spoke-ec2/aviatrix"
  version = "1.0.14"

  count = 2

  name            = "avffsp${count.index}"
  cidr            = var.spoke_cidrs[count.index]
  region          = "eu-central-1"
  account         = "Eskimoo"
  transit_gw      = "avx-avffhub-transit"
  vpc_subnet_size = "24"

  ha_gw = "false"
  instance_size = "t2.micro"

  ec2_key = "KP_AVI_EC2_SPOKE"
}


  
  
