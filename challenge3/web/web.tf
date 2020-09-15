variable "webname" {
    type = string
}
resource "aws_instance" "web"{
    ami = "ami-08c148bb835696b45"
    instance_type = "t2.micro"
    security_groups = [module.sg.sgname]
    user_data = file("./web/server-script.sh")

    tags = {
        Name = var.webname
    }
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../security_group"
}

output "public_ip" {
    value = module.eip.PublicIP
}