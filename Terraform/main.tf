#Create 2 subnets , Create 4 ec2 instances , 2 in each subnets!
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.54.1"
    } 
 }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
  project = "Project-2"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      "Name" = "${local.project}-vpc" 
    }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2 
  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}

#Creating EC2 instances
resource "aws_instance" "main" {
  ami = "ami-04a37924ffe27da53"
  instance_type = "t2.micro"
  count = 4
  subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))


  tags = {
    Name = "${local.project}-instance-${count.index}"
  }
}



output "aws_subnet_id" {
  value = aws_subnet.main[*].id
}