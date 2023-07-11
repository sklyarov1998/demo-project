terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_vpc" "vpc" {

  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "public-snet" {

  cidr_block = "10.0.1.0/24"

  availability_zone = var.zone-public

  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "private-snet" {

  cidr_block = "10.0.2.0/24"

  availability_zone = var.zone-private

  vpc_id = aws_vpc.vpc.id
}

resource "aws_network_acl" "public-acl" {
    
  vpc_id = aws_vpc.vpc.id

  subnet_ids = [ "10.0.1.0/24" ]

}

resource "aws_network_acl_rule" "HTTPs" {
  network_acl_id = aws_network_acl.public-acl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "PostgreSQL" {
  network_acl_id = aws_network_acl.public-acl.id
  rule_number    = 101
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.2.0/24"
  from_port      = 5432
  to_port        = 5432
}

resource "aws_network_acl" "private-acl" {

  vpc_id = aws_vpc.vpc.id

  subnet_ids = [ "10.0.2.0/24" ]

}