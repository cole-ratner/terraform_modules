terraform {
  backend "remote" {
    organization = "Gravityloop"
    workspaces {
      name = "terraform_modules"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"

  tags = {
    Name = "testInstance"
  }
}
