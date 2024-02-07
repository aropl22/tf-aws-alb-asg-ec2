variable "domain_name" {
  description = "Website Domian Name"
  type        = string
}

variable "sgroup_alb1" {
  type = list(object({
    port_from         = number
    port_to           = number
    protocol          = string
    remote_cidr_block = string
  }))
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "default_tags" {
  type = map(any)
  default = {
    managed_by : "Terraform",
    stack : "test",
    project : "1"
  }
}