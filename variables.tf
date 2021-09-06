variable "spoke_cidrs" {
    description = "CIDRS for use in the spoke VPC"
    type = list(string)
    default = ["10.77.16.0/20", "10.77.32.0/20"]
}


data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "Aviatrix_Controller_Password"
}

locals {
  ctlr_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  
}

