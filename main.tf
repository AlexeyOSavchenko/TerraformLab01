terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~>1.0"  
}

provider "aws" {
  region = "eu-west-1"
}

data "aws_vpcs" "vpc_ids" {}
data "aws_vpc" "my_vpc" {
  for_each = toset(data.aws_vpcs.vpc_ids.ids)
  id       = each.value
}

data "aws_subnets" "subnet_ids" {}
data "aws_subnet" "my_subnet" {
  for_each = toset(data.aws_subnets.subnet_ids.ids)
  id       = each.value
}

data "aws_security_groups" "sg_ids" {}
data "aws_security_group" "my_sg" {
  for_each = toset(data.aws_security_groups.sg_ids.ids)
  id       = each.value
}

