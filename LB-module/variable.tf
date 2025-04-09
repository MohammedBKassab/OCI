variable "policy" {
    type = string
    #default = "ROUND_ROBIN, LEAST_CONNECTIONS, IP_HASH"
  
}

variable "display_name" {
    type = string
    #default = "wind-LB"
  
}

variable "listner_display_name" {
    type = string
    #default = "wind-listner"
}

variable "port" {
    type = list(number)
    #default = [ 80, 443 ]
}

variable "protocol" {
    type = list()
    #default = [ "HTTP", "HTTPS" ]
  
}

variable "ackendset_display_name" {
    type = string
}

variable "backend_ips" {
  type = map(string)
}