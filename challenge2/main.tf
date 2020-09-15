provider "aws"{
    region = "eu-central-1"
}

resource "aws_instance" "db"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

resource "aws_instance" "web"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
    user_data = file("server-script.sh")

    tags = {
        Name = "Web Server"
    }
}

resource "aws_eip" "elasticip"{
    instance = aws_instance.web.id
}

variable "ingressrules" {
    type = list(number)
    default =[80,443]
}

variable "egressrules" {
    type = list(number)
    default =[80,443]
}
resource "aws_security_group" "webtraffic"{
    name = "Allow HTTP and HTTPS"

    dynamic "ingress"{
        iterator = port
        for_each = var.ingressrules
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress"{
        iterator = port
        for_each = var.egressrules
        content{
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "DBprivateip" {
    value = aws_instance.db.private_ip
}

output "eippublicip" {
    value = aws_eip.elasticip.public_ip
}
