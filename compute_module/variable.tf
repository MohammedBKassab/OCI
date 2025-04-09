variable "shape" {
    type = string
    # default = "VM.Standard.E2.1.Micro"
}

variable "availability_domain" {
    type = string
    # default = "1"
}

variable "instances_name" {
    type = list(string)
    #default = ["instance1", "instance2"]
  
}

