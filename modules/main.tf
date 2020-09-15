provider "aws"{
    region = "eu-central-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "EC2 created by Module"
}

output "module_output" {
    value = module.ec2module.instance_id
}