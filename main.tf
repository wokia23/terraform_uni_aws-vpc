resource "aws_vpc" "univpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy  = var.instance_tenancy
  tags = var.tag_overlay 
}

#creating the IGW
resource "aws_internet_gateway" "uniigw" {
  vpc_id = aws_vpc.univpc.id

  tags = var.tag_overlay
}

#creat a public and private subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.univpc.id
  cidr_block = var.pubsubnet_cidr_block

  tags = {
    Name = "Public_Subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.univpc.id
  cidr_block = var.privsubnet_cidr_block

  tags = {
    Name = "Private_Subnet"
  }
}

#creating the route table for the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.univpc.id

  route {
    cidr_block = var.pubrt_cidrblock
    gateway_id = aws_internet_gateway.uniigw.id
  }

  tags = {
    Name = "PubSNRT"
  }
}

#creating the route table for the private subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.univpc.id

  route {
    cidr_block = var.privrt_cidrblock
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "PriSNRT"
    }
}

#creating nat gateway for the private subnet
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NATGW"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency 
  # on the Internet Gateway for the VPC.connection {
  depends_on = [aws_internet_gateway.uniigw, aws_eip.eip]
}

resource "aws_eip" "eip" {
}

resource "aws_route_table_association" "pubRT" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "privRT" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}