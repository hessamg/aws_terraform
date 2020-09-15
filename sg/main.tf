provider "aws"{
    region = "eu-central-1"
}

resource "aws_instance" "ec2"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic"{
    name = "Allow Web Traffic."
    
    ingress{
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
