variable "spoke_cidrs" {
    description = "CIDRS for use in the spoke VPC"
    type = list(string)
    default = ["10.77.16.0/20", "10.77.32.0/20"]
}

variable "ctrl_password" {
    type = string
}

