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

    tags = {
        Name = "Web Server"
    }

    depends_on =[aws_instance.db]
}

# To query DB the following codes were added. 
# run "terraform apply -auto-approve" to query and discard the prompt question to apply "yes". USE IT CAUTIOUSLY  
data "aws_instance" "dbsearch"{
    filter{
        name = "tag:Name"
        values = ["DB Server"]
    }
}

output "dbservers_availability_zone" {
    value = data.aws_instance.dbsearch.availability_zone
}