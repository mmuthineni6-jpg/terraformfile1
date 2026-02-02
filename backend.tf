terraform {
  backend "s3" {
    bucket = "jenkins1-bucket11"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

