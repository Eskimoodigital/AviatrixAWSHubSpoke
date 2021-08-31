


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
  source  = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version = "4.0.3"

  name            = "avffsp1"
  cidr            = "10.77.16.0/20"
  region          = "eu-central-1"
  account         = "Eskimoo"
  transit_gw      = "avx-avffhub-transit"
  
  

  ha_gw = "false"
  instance_size = "t2.micro"
}
