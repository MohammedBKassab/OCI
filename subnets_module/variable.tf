variable "cidr_block" {
    type = string
    #default = "10.0.0.0/16"  
}

variable "display_name" {
    type = list(string)
    #default = [ "public-subnet-1", "public-subnet-2", "private-subnet-1", "private-subnet-2" ]
}
