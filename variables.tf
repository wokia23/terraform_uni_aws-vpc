variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}
  

variable "instance_tenancy" {
    description = "Instance tenancy for the VPC"
    type        = string
  }

variable "tag_overlay" {
  description = "Tags for the VPC"
  type        = map(string)
}

variable "pubsubnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "privsubnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "pubrt_cidrblock" {
  description = "CIDR block for the public route table"
  type        = string
}

variable "privrt_cidrblock" {
  description = "CIDR block for the private route table"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

#variable "instance_type" {
#  description = "Instance type for the EC2 instance"
#  type        = string
#}

variable "ec2_names" {
  description = "List of EC2 instance names"
  type        = list(string)
}