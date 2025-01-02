terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.12.0" 
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "Final-Project" {
  key_name   = "my-aws-key"
  public_key = file("~/.ssh/id_rsa.pem.pub")
}


resource "aws_instance" "Final-Project" {
  ami           = "ami-0e2c8caa4b6378d8c" #UbuntuAMI
  instance_type = "t2.medium"

  key_name        = aws_key_pair.Final-Project.key_name
  subnet_id       = aws_subnet.Final-Project.id
  security_groups = [aws_security_group.Final-Project.id]

  tags = {
    Name = "Final-Project-vm"
  }
}
