terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "John-remote-backend-2020"
        region = "eu-central-1"
        access_key = ""
        secret_key = ""
    }
}