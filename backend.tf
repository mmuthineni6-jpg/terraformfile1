terraform {
  backend "s3" {
    bucket = "srikanth-terraform-state-001"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

