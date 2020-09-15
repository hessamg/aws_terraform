provider "aws"{
    region = "eu-central-1"
}

resource "aws_instance" "ec2"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticip"{
    instance = aws_instance.ec2.id
}

output "eip" {
    value = aws_eip.elasticip.public_ip
}