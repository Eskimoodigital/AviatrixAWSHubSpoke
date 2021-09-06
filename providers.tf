# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = "35.162.98.189"
  username                = "admin"
  password                = local.ctlr_creds
  
}



provider "aws" {
    region = "eu-central-1"
}