# VPC
# https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "hina-vpc"
  }
}

# Subnet
# https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "public_1a" {
  # 先程作成したVPCを参照し、そのVPC内にSubnetを立てる
  vpc_id = "${aws_vpc.network.id}"

  # Subnetを作成するAZ
  availability_zone = "ap-northeast-1a"

  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "hina-public-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id = "${aws_vpc.network.id}"

  availability_zone = "ap-northeast-1b"

  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "hina-public-1b"
  }
}


# Private Subnets
resource "aws_subnet" "private_1a" {
  vpc_id = "${aws_vpc.network.id}"

  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.10.0/24"

  tags = {
    Name = "hina-private-1a"
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id = "${aws_vpc.network.id}"

  availability_zone = "ap-northeast-1b"
  cidr_block        = "10.0.20.0/24"

  tags = {
    Name = "hina-private-1b"
  }
}