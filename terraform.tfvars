vpc_cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
tag_overlay = {
  Name = "uniVPC"
  Environment = "Sandbox"
  Project = "1234"
  PM = "wokia kumase"
}

pubsubnet_cidr_block = "10.0.0.0/24"
privsubnet_cidr_block = "10.0.1.0/24"
pubrt_cidrblock = "0.0.0.0/0"
privrt_cidrblock = "0.0.0.0/0"
ami = "ami-0f88e80871fd81e91" 
#instance_type = "t2.micro" 
ec2_names = ["test", "sandbox"]