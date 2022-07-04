terraform {
  backend "s3"{
    bucket = "terra-vprofile-state1231"
    key = "terraform/backend"
    region = "us-east-2"
  }
}