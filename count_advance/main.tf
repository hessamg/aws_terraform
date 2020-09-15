provider "aws"{
    region = "eu-central-1"
}

module "db" {
    source = "./db"
    dbname = ["mysql", "mariadb", "mssql"]
}

output "private_ip" {
    value = module.db.private_ip
}