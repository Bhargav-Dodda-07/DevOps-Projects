# VPC

resource "aws_vpc" "main" {
  count = length(var.vpc_cidrs)
  cidr_block       = var.vpc_cidrs[count.index]
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${local.common_name_suffix}-vpc"
  }
}

# INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main[0].id

  tags = {
    Name = "${local.common_name_suffix}-igw"
  }
}