provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2"{
    cidr_block = "192.168.0.0/24"
}

# terraform import aws_vpc.myvpc2 vpc-03dv7c242cd8c8929 (vpc id)
