terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.region
}
resource "aws_security_group" "sc" {
    ingress  {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
    ingress  {
        from_port   = 9090
        to_port     = 9090
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
        from_port   = 6379
        to_port     = 6379
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
    ingress  {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
    ingress  {
        from_port   = 9093
        to_port     = 9093
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
        from_port   = 9100
        to_port     = 9100
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
        from_port   = 9121
        to_port     = 9121
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
        from_port   = 9113
        to_port     = 9113
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
     egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ={
        Name="security-group"
    }
  
}
resource "aws_key_pair" "monitoring_key" {
  key_name = var.key_name
  public_key = file(var.key_path)
}
resource "aws_instance" "prometheus_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ aws_security_group.sc.name]
  associate_public_ip_address = true
  tags = {
    Name="prometheus-ec2"
  }
}
resource "aws_instance" "infra_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.sc.name]
  associate_public_ip_address = true
  tags = {
    Name="infra-ec2"
  }
}
resource "aws_instance" "App_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ aws_security_group.sc.name ]
  associate_public_ip_address = true
  tags = {
    Name="App-ec2"
  }
}