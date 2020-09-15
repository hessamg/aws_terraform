provider "aws"{
    region = "eu-central-1"
}

variable "number_of_servers" {
    type = number
}
resource "aws_instance" "ec2"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
    count = var.number_of_servers
}

# terraform plan -var-file = test.tfvars  (or)  prod.tfvars