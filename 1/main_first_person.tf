# This is a file for Infrastructure

provider "aws" {
  region     = "eu-west-1"
}
#-------------------------------------- Save File to Bucket -------------------------------------------
terraform {
  backend "s3" {
    bucket = "elad-test15555"
    key = "dev/elad1/terraform.tfstate"
    region = "eu-central-1"
  }
}

#------------------------------------------- Default VPC ----------------------------------------------
resource "aws_default_vpc" "default" {
}



/*  ----------------------------------------- New VPC --------------------------------------------------
resource "aws_vpc" "Elad_Vpc" {
  cidr_block       = "10.0.0.0/16"
tags = {
    Name = "Elad_vpc_test"
 }
}
----------------------------------------- New Subnet1 --------------------------------------------------
resource "aws_subnet" "Elad_subnet1" {
  vpc_id     = aws_vpc.Elad_Vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Elad_Subnet1"
  }
}
----------------------------------------- New Subnet2 --------------------------------------------------
resource "aws_subnet" "Elad_subnet2" {
  vpc_id     = aws_vpc.Elad_Vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Elad_Subnet2"
  }
}
*/

#----------------------------------------- Security Group--------------------------------------------------


resource "aws_security_group" "Elad_Security_Group" {
  name        = "EladWeb Security Group"
  description = "Elad_Security_Group"
  vpc_id = aws_default_vpc.default.id
  tags = {
    Name  = "Elad_Terraform_sg"
    Owner = "Elad"
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}