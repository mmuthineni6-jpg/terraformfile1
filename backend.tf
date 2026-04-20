terraform {
  backend "s3" {
    bucket = "jenkins-eks1"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}

