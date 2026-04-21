terraform {
  backend "s3" {
    bucket = "jenkins-eks2"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}

