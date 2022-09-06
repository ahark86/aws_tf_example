terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "something_else" {
  type = string
}

provider "aws" {
  region  = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
