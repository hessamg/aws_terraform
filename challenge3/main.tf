provider "aws"{
    region = "eu-central-1"
}

module "db" {
    source = "./db"
    dbname = "DB Server Module"
}

module "web" {
    source = "./web"
    webname = "Web Server Module"
}

output "db_output" {
    value = module.db.private_ip
}

output "eip_output" {
    value = module.web.public_ip
}
