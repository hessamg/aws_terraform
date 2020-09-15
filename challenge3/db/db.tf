variable "dbname" {
    type = string
}

resource "aws_instance" "db"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"

    tags = {
        Name = var.dbname
    }
}

output "private_ip" {
    value = aws_instance.db.private_ip
}