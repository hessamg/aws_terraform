provider "aws"{
    region = "eu-central-1"
}

resource "aws_instance" "ec2"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
    count = 3
}